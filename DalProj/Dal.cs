using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DalProj
{
    public class Dal
    {
        //private static string conStr = @"Data Source = ELAD1H\SQLEXPRESS;Initial Catalog = Project; Integrated Security = True";
        //private static string conStr = @"Data Source=ELAD_SSD\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True";
        private static string conStr = ConfigurationManager.ConnectionStrings["LIVEDNS"].ConnectionString;
        //private static SqlConnection Con = new SqlConnection(conStr);
        //private static SqlDataAdapter adtr;
        //private static SqlCommand cmd;



        public static DataTable Register(string username, string email, string password)

        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
               
                Con.Open();
                cmd = new SqlCommand("Create_User", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("userName", username));
                cmd.Parameters.Add(new SqlParameter("userEmail", email));
                cmd.Parameters.Add(new SqlParameter("password", password));

                adtr = new SqlDataAdapter(cmd);
                DataSet registData = new DataSet();
                adtr.Fill(registData, "user");
                if (registData.Tables["User"] != null)
                {
                    return registData.Tables["User"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }


        public static DataTable Login(string username, string password)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();
                cmd = new SqlCommand("Login", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("userName", username));
                cmd.Parameters.Add(new SqlParameter("password", password));
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "user");

                if (dataset.Tables["User"].Rows.Count != 0)
                {
                    return dataset.Tables["User"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }

        public static DataTable AddComment(int userId, int songId, string username, string freeText)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();
                cmd = new SqlCommand("Add_Comment", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("UserId", userId));
                cmd.Parameters.Add(new SqlParameter("SongId", songId));
                cmd.Parameters.Add(new SqlParameter("Username", username));
                cmd.Parameters.Add(new SqlParameter("FreeText", freeText));
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "comment");

                if (dataset.Tables["Comment"].Rows.Count != 0)
                {
                    return dataset.Tables["Comment"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }

            }
        }

        public static DataTable SongsList()
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();
                cmd = new SqlCommand("SELECT * FROM Songs_List", Con);
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "song");

                if (dataset.Tables["Song"].Rows.Count != 0)
                {
                    return dataset.Tables["Song"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }


        public static DataTable CommentsList()
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;

            try
            {         
                Con.Open();
                cmd = new SqlCommand("SELECT * FROM Comments_List", Con);
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "comment");

                if (dataset.Tables["Comment"].Rows.Count != 0)
                {
                    return dataset.Tables["Comment"];
                }
                return null;

                //DataTable MyTable = new DataTable(); 
                //DataTable MyTableByName = new DataTable("MyTableName");
                //MyTable.Columns.Add("SongID", typeof(int));
                //MyTable.Columns.Add("UserID", typeof(int));
                //MyTable.Columns.Add("Username", typeof(string));
                //MyTable.Columns.Add("CommentText", typeof(string));

                //DataRow row = MyTable.NewRow();
                //row["SongID"] = 16;
                //row["UserID"] = 1;
                //row["Username"] = "Elad";
                //row["CommentText"] = "This live version in much better than the album version!";
                //MyTable.Rows.Add(row);
                ////SongID":16,"UserId":1,"Username":"Elad","CommentText":"This live version in much better than the album version!"}
                //return MyTable;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }

        public static DataTable PlaylistList()
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {

                Con.Open();
                cmd = new SqlCommand("SELECT * FROM Playlists_List", Con);
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "playlists");

                if (dataset.Tables["playlists"].Rows.Count != 0)
                {
                    return dataset.Tables["playlists"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }

        public static DataTable PlaylistSongsList()
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {

                Con.Open();
                cmd = new SqlCommand("SELECT * FROM Playlist_Songs_list", Con);
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "playlistSongs");

                if (dataset.Tables["playlistSongs"].Rows.Count != 0)
                {
                    return dataset.Tables["playlistSongs"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }

        }

        public static DataTable PlaylistsImagesList()
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {

                Con.Open();
                cmd = new SqlCommand("SELECT * FROM Playlists_Images_List", Con);
                adtr = new SqlDataAdapter(cmd);
                DataSet dataset = new DataSet();
                adtr.Fill(dataset, "playlistImages");

                if (dataset.Tables["playlistImages"].Rows.Count != 0)
                {
                    return dataset.Tables["playlistImages"];
                }
                return null;

            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }

        }

        public static DataTable CreatePlaylist(int userId, string playlistName, int playlistImgId)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {

                Con.Open();
                cmd = new SqlCommand("Create_Playlist", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("user_Id", userId));
                cmd.Parameters.Add(new SqlParameter("playlist_Name", playlistName));
                if (playlistImgId == 0)
                {
                    cmd.Parameters.Add(new SqlParameter("playlist_Img_Id", DBNull.Value));
                }
                else
                {
                    cmd.Parameters.Add(new SqlParameter("playlist_Img_Id", playlistImgId));
                }
                adtr = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adtr.Fill(ds, "playlistData");

                if (ds.Tables["playlistData"] != null)
                {
                    return ds.Tables["playlistData"];
                }
                return null;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }



        public static bool DeletePlaylist(int playlistId)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();
                cmd = new SqlCommand("Delete_Playlist", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("playlist_Id", playlistId));

                adtr = new SqlDataAdapter(cmd);
                DataSet regData = new DataSet();
                adtr.Fill(regData, "playlist");
                return true;

            }
            catch (Exception e)
            {
                return false;
            }

            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }


        public static bool AddPlaylistSong(int[] SongIds, int PlaylistId)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();

                for (int i = 0; i < SongIds.Length; i++)
                {
                    cmd = new SqlCommand("Add_Playlist_Songs", Con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("playlistID", PlaylistId));
                    cmd.Parameters.Add(new SqlParameter("songID", SongIds[i]));
                    adtr = new SqlDataAdapter(cmd);
                    DataSet songData = new DataSet();
                    adtr.Fill(songData, "addSong");
                }

                return true;
            }
            catch (Exception e)
            {
                return false;
            }

            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }




        public static bool DeletePlaylistsSong(int songId, int seqNumber)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();
                cmd = new SqlCommand("Delete_Playlists_Song", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("SongID", songId));
                cmd.Parameters.Add(new SqlParameter("SeqNumber", seqNumber));


                adtr = new SqlDataAdapter(cmd);
                DataSet regData = new DataSet();
                adtr.Fill(regData, "songDel");
                return true;

            }
            catch (Exception e)
            {
                return false;
            }

            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }


        public static bool AddlikeToSong(int userID, int songID, bool songLike)
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {
                Con.Open();
                cmd = new SqlCommand("Add_Remove_Like", Con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("User_ID", userID));
                cmd.Parameters.Add(new SqlParameter("SongID", songID));
                cmd.Parameters.Add(new SqlParameter("Song_like", songLike));

                adtr = new SqlDataAdapter(cmd);
                DataSet likeData = new DataSet();
                adtr.Fill(likeData, "songLike");
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }
        }

        public static DataTable UsersLikesList()
        {
            SqlConnection Con = new SqlConnection(conStr);
            SqlDataAdapter adtr;
            SqlCommand cmd;
            try
            {  
                Con.Open();
                cmd = new SqlCommand("SELECT * FROM Songs_Likes_List", Con);
                adtr = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                adtr.Fill(dataSet, "LikesList");

                if (dataSet.Tables["LikesList"].Rows.Count != 0)
                {
                    return dataSet.Tables["LikesList"];
                }
                return null;

                //DataTable MyTable = new DataTable(); // 1
                //DataTable MyTableByName = new DataTable("MyTableName");
                //MyTable.Columns.Add("UserID", typeof(int));
                //MyTable.Columns.Add("SongID", typeof(int));
                //MyTable.Columns.Add("LikeSong", typeof(bool));

                //DataRow row = MyTable.NewRow();
                //row["UserID"] = 1;
                //row["SongID"] = 24;
                //row["LikeSong"] = true;
                //MyTable.Rows.Add(row);

                //return MyTable;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                if (Con != null && Con.State == ConnectionState.Open)
                {
                    Con.Close();
                }
            }

        }

    }
}

