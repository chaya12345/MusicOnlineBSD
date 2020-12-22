using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToCommitsToArticlesDTO
    {
        public static CommitsToArticlesDTO Getcommit(CommitsToArticlesTBL commit)
        {
            if (commit == null)
                return null;
            CommitsToArticlesDTO newCommits = new CommitsToArticlesDTO();
            newCommits.id = commit.id;
            newCommits.articleId = commit.articleId;
            newCommits.name = commit.name;
            newCommits.title = commit.title;
            newCommits.content = commit.content;
            newCommits.date = commit.date;
            newCommits.tested = commit.tested;
            return newCommits;
        }
        public static List<CommitsToArticlesDTO> GetCommits(List<CommitsToArticlesTBL> Commits)
        {
            if (Commits == null)
                return null;
            List<CommitsToArticlesDTO> newCommits = new List<CommitsToArticlesDTO>();
            foreach (CommitsToArticlesTBL res in Commits)
            {
                CommitsToArticlesDTO CommitsToArticlesDTO = Getcommit(res);
                if(CommitsToArticlesDTO!=null)
                newCommits.Add(CommitsToArticlesDTO);
            }
            return newCommits;
        }
    }
}
