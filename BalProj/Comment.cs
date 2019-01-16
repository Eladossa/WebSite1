using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalProj
{
    public class Comment
    { 
        
        public int SongID { get; set; }
        public int UserId { get; set; }
        public string Username { get; set; }
        public string CommentText { get; set; }

        public Comment( int songId, int userId, string username, string commentText)
        {
            SongID = songId;
            UserId = userId;
            Username = username;
            CommentText = commentText;
        }
    }
}
