using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalProj
{
    public class Playlist
    {
        public int UserId { get; set; }
        public string PlaylistName { get; set; }
        public int PlaylistImg { get; set; }
        public int PlaylistID { get; set; }  
        
        public Playlist(int userId)
        {
            UserId = userId;
            //PlaylistName = playlistName;
            //PlaylistImg = playlistImg;
        }


    }
}
