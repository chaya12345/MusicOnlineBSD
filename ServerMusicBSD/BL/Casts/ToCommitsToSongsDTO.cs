using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToCommitsToSongsDTO
    {
        public static CommitsToSongsDTO Getcommit(CommitsToSongsTBL commit)
        {
            if (commit == null)
                return null;
            CommitsToSongsDTO newCommits = new CommitsToSongsDTO();
            newCommits.id = commit.id;
            newCommits.songId = commit.songId;
            newCommits.name = commit.name;
            newCommits.title = commit.title;
            newCommits.content = commit.content;
            newCommits.date = commit.date;
            newCommits.tested = commit.tested;
            return newCommits;
        }
        public static List<CommitsToSongsDTO> GetCommits(List<CommitsToSongsTBL> Commits)
        {
            if (Commits == null)
                return null;
            List<CommitsToSongsDTO> newCommits = new List<CommitsToSongsDTO>();
            foreach (CommitsToSongsTBL res in Commits)
            {
                CommitsToSongsDTO CommitsToSongsDTO = Getcommit(res);
                if(CommitsToSongsDTO!=null)
                newCommits.Add(CommitsToSongsDTO);
            }
            return newCommits;
        }
    }
}
