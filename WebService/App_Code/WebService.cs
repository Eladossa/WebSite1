using BalProj;
using DalProj;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;



[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]


public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    public string Register(string username, string email, string password)
    {
        return Bal.Register(username, email, password);
    }


    [WebMethod]
    public string Login(string username, string password)
    {
        return Bal.Login(username, password);
    }


    [WebMethod]
    public string AddComment(int userId, int songId, string username, string freeText)
    {
        return Bal.AddComment(userId, songId, username, freeText);
    }


    [WebMethod]
    public string CreatePlaylist(int userId, string playlistName, int playlistImgId)
    {
        return Bal.CreatePlaylist(userId, playlistName, playlistImgId);
    }


    [WebMethod]
    public string AddPlaylistSongs(string songIds, int playlistId)
    {

        // songIds = Convert.ToInt32(Convert.ToString(s[1]);

        int[] array = songIds.Split(',').Select(str => int.Parse(str)).ToArray();

        return Bal.AddPlaylistSong(array, playlistId);
    }


    [WebMethod]
    public string DeletePlayListsSong(int songId, int seqNumber)
    {
        return Bal.DeletePlaylistsSong(songId, seqNumber);
    }
	
	
		
    [WebMethod]
    public string DeletePlaylist(int playlistId)
    {
        return Bal.DeletePlaylist(playlistId);
    }


    [WebMethod]
    public string AddLikeToSong(int userID, int songID, bool songLike)
    {
        return Bal.AddLikeToSong(userID, songID, songLike);
    }
	
	


    [WebMethod]
    public string SongsList()
    {
        return Bal.SongsList();
    }

    [WebMethod]
    public string CommentsList()
    {
        return Bal.CommentsList();
    }

    [WebMethod]
    public string CommentsList2()
    {
        return Bal.CommentsList2();
    }

    [WebMethod]
    public string PlaylistsList()
    {
        return Bal.PlaylistsList();
    }

    [WebMethod]
    public string PlaylistSongsList()
    {
        return Bal.PlaylistSongsList();
    }

    [WebMethod]
    public string PlaylistImagesList()
    {
        return Bal.PlaylistImagesList();
    }

    [WebMethod]
    public string UsersLikesList()
    {
        return Bal.UsersLikesList();
    }


}