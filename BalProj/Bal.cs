using DalProj;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace BalProj
{
    public class Bal
    {
        static public string Register(string username, string email, string password)
        {

            DataTable registration = Dal.Register(username, email, password);

            User u = new User((string)registration.Rows[0]["UserName"], (string)registration.Rows[0]["Password"]);
            u.ID = (int)registration.Rows[0]["User_ID"];
            u.UserEmail = (string)registration.Rows[0]["UserEmail"];



            return new JavaScriptSerializer().Serialize(u);

        }

        static public string Login(string username, string password)
        {
            DataTable userTable = Dal.Login(username, password);

            if (userTable != null)
            {
                User u = new User((string)userTable.Rows[0]["UserName"], (string)userTable.Rows[0]["Password"]);
                u.ID = (int)userTable.Rows[0]["User_ID"];

                return new JavaScriptSerializer().Serialize(u);
            }
            else
            {
                return new JavaScriptSerializer().Serialize("no user!");
            }
        }


        static public string AddComment(int userId, int songId, string username, string freeText) /// מחזיר לי את התגובה
        {
            DataTable commentTable = Dal.AddComment(userId, songId, username, freeText);

            Comment comm = new Comment((int)commentTable.Rows[0]["SongId"], (int)commentTable.Rows[0]["UserId"],
                             (string)commentTable.Rows[0]["Comment"], (string)commentTable.Rows[0]["Username"]); // הסדר חשוב (?)
            //com.SongID = (int)commentTable.Rows[0]["SongId"];
            //com.UserId = (int)commentTable.Rows[0]["UserId"];
            //com.CommentText = (string)commentTable.Rows[0]["Comment"];

            return new JavaScriptSerializer().Serialize(comm);

        }

     


        static public string CreatePlaylist(int userId, string playlistName, int playlistImgId)
        {
            DataTable playlistTable = Dal.CreatePlaylist(userId, playlistName, playlistImgId);

            Playlist p = new Playlist((int)playlistTable.Rows[0]["UserID"]);

            p.PlaylistName = playlistTable.Rows[0]["Playlist_Name"] == DBNull.Value ? null : (string)playlistTable.Rows[0]["Playlist_Name"];
            p.PlaylistImg = playlistTable.Rows[0]["Playlist_Img_ID"] == DBNull.Value ? 0 : (int)playlistTable.Rows[0]["Playlist_img_ID"];
            p.PlaylistID = (int)playlistTable.Rows[0]["Playlist_ID"];

            return new JavaScriptSerializer().Serialize(p);
        }

        static public string DeletePlaylist(int playlistId)
        {
            bool deletingPlaylist = Dal.DeletePlaylist(playlistId);
            return new JavaScriptSerializer().Serialize(deletingPlaylist);
        }



        static public string AddPlaylistSong(int[] SongIds, int PlaylistId)
        {
            bool addPlaylistSong = Dal.AddPlaylistSong(SongIds, PlaylistId);
            return new JavaScriptSerializer().Serialize(addPlaylistSong);
        }



        static public string DeletePlaylistsSong(int songId, int seqNumber)
        {
            bool deletingPlaylistSong = Dal.DeletePlaylistsSong(songId, seqNumber);

            return new JavaScriptSerializer().Serialize(deletingPlaylistSong);
        }



        static public string AddLikeToSong(int userID, int songID, bool songLike)
        {
            bool addLikeToSong = Dal.AddlikeToSong(userID, songID, songLike);

            return new JavaScriptSerializer().Serialize(addLikeToSong);
        }



        static public string SongsList()
        {
            DataTable songTable = Dal.SongsList();

            return DataTableToJsonObj(songTable);

        }

        static public string UsersLikesList()
        {
            DataTable usersLikesTable = Dal.UsersLikesList();

            return DataTableToJsonObj(usersLikesTable);
        }

        static public string CommentsList()
        {
            DataTable commentTable = Dal.CommentsList();

            return DataTableToJsonObj(commentTable);
        }


        static public string PlaylistsList()
        {
            DataTable playlistsTable = Dal.PlaylistList();

            return DataTableToJsonObj(playlistsTable);
        }

        static public string PlaylistSongsList()
        {
            DataTable playlistSongsTable = Dal.PlaylistSongsList();

            return DataTableToJsonObj(playlistSongsTable);
        }

        static public string PlaylistImagesList()
        {
            DataTable playlistImages = Dal.PlaylistsImagesList();

            return DataTableToJsonObj(playlistImages);
        }

        static public string CommentsList2()
        {
            DataTable commentTable = Dal.CommentsList();

            DataSet ds = new DataSet();

            ds.Merge(commentTable);

            List<Comment> commentList = new List<Comment>(); //// חסר הID של התגובה comment

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    commentList.Add(new Comment((int)ds.Tables[0].Rows[i]["SongId"], (int)ds.Tables[0].Rows[i]["UserId"],
                        (string)ds.Tables[0].Rows[i]["Username"], (string)ds.Tables[0].Rows[i]["Comment"]));
                }
            }

            return new JavaScriptSerializer().Serialize(commentList);
        }




        static private string DataTableToJsonObj(DataTable dt)
        {
            DataSet ds = new DataSet();
            ds.Merge(dt);
            StringBuilder JsonString = new StringBuilder();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                JsonString.Append("[");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    JsonString.Append("{");
                    for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                    {
                        if (j < ds.Tables[0].Columns.Count - 1)
                        {
                            JsonString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds.Tables[0].Rows[i][j].ToString() + "\",");
                        }
                        else if (j == ds.Tables[0].Columns.Count - 1)
                        {
                            JsonString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds.Tables[0].Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == ds.Tables[0].Rows.Count - 1)
                    {
                        JsonString.Append("}");
                    }
                    else
                    {
                        JsonString.Append("},");
                    }
                }
                JsonString.Append("]");
                return JsonString.ToString();
            }
            else
            {
                return null;
            }
        }

    }
}
