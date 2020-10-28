using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToFollowUpDTO
    {
        public static FollowUpDTO GetFollowUp(FollowUpTBL followUp)
        {
            if (followUp == null)
                return null;
            FollowUpDTO newFollow = new FollowUpDTO();
            newFollow.id = followUp.id;
            newFollow.userId = followUp.userId;
            newFollow.mail = followUp.mail;
            newFollow.songId = followUp.songId;
            newFollow.articleId = followUp.articleId;
            return newFollow;
        }
        public static List<FollowUpDTO> GetFollowUps(List<FollowUpTBL> followUps)
        {
            if (followUps == null)
                return null;
            List<FollowUpDTO> newFollow = new List<FollowUpDTO>();
            foreach (FollowUpTBL item in followUps)
            {
                FollowUpDTO followUpDTO = GetFollowUp(item);
                if (followUpDTO != null)
                    newFollow.Add(followUpDTO);
            }
            return newFollow;
        }
    }
}
