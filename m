Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25646C352B6
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.7374.1649431442354411501
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 08:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pencrXin;
 spf=pass (domain: linaro.org, ip: 209.85.222.48,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-ua1-f48.google.com with SMTP id a20so4661382uaq.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WcKpnARJPRDOiw6ekALdbRhsmQ+pwodC4yrKelELPfk=;
        b=pencrXindkBwXFpNzweaBWGGjX9ULxWvSy8nhe/HvKXdeVEyflGG9cuiZHWzlkmZCj
         eAPPxEKASvQju8nA9ThbIPyDu/g2+/Kdf1wsxjGgi5aiLJrj9/RgLd1afMGC+n0Ebfwn
         X8gHVVbNnKqq+/1yEjRg9n0Z1RDv4a+vuNZLARWtPfTxL60+jfS3wLk/DP9itP8HkQbI
         EgZvAMMiY6gebXGXwbjUa7im7P8toMHFRGk/B1LBQLH+dZ7gfWWNWhZihr5zNwQp7NmG
         AkAetsKlIo1kd98Tfm2cy7AufXNk/Bj9gOG5cix8Xuauac+cDOarh/z7TK74dgQfPAqZ
         GIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WcKpnARJPRDOiw6ekALdbRhsmQ+pwodC4yrKelELPfk=;
        b=PDePJh4Sv47mpiXKCyuCEmf69BCXdrH5LGlguYiwBrbWUNbrAdkXFekqClnHmWs4Ue
         d0+rT0hgQf7A5YqasSsuyw03M7D4MvMI1+vML+XD8L+JSIye8R0H8IDRSFxNP8rmeTqe
         p/DsAud+9bx6eW88gBlJUenYgmmZHHSeVTdWC+89LgEneC1Vc6CDFRCxPFWTL4oiGwyN
         tgIr5+2X909ZDxcM/63I9s/kqYsBh0lP9aCSWe1Ib6BArmzdP0kkync5Gw0eClbMMcJL
         w2JdMGdlPb+Cq6hnypj4b6Db9i+fSTN/6eER4aWZ2zut8eDQiSmf3Xs0S4TZIWUp5YSe
         XzqQ==
X-Gm-Message-State: AOAM5330indx4hGA+TU12M8IOkmkt1QCDSPGGtpKN2C22svdMKLJW4Wv
	zmEuCCzyghv4v6Fcwd4KlN77C6sX3GPa1VowuPZkp9J3WkUJ+A==
X-Google-Smtp-Source: 
 ABdhPJymzW2BjE+nkSwYA22jacWAPy4TZb1yfnkkmtBJVHOAkH9EMPFdtxNRSJz/GwWzWmABfafYvzSOIcFHG7fYPQw=
X-Received: by 2002:ab0:70d7:0:b0:359:f05c:38bb with SMTP id
 r23-20020ab070d7000000b00359f05c38bbmr5763993ual.76.1649431441383; Fri, 08
 Apr 2022 08:24:01 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANp-EDaiKQQpeKqB_tXek5+3arUHn0vm6-DhQ-=QBKxP9+PSwQ@mail.gmail.com>
 <CAAnfSTvbnpbe5a=KdTxXiw1F0F8-jtKufSc2WzW5bCUQ3iGR0g@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvbnpbe5a=KdTxXiw1F0F8-jtKufSc2WzW5bCUQ3iGR0g@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Fri, 8 Apr 2022 11:23:50 -0400
Message-ID: 
 <CANp-EDb4kHbzAwZwR6+XrCa3QwrsvzkF8QmzDTEmgUPYR9xBYQ@mail.gmail.com>
Subject: Re: [meta-arm] CVE exclusions for dunfell
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3265

On Thu, Apr 7, 2022 at 11:19 AM Ross Burton <ross@burtonini.com> wrote:
>
> Yes, but they'll need to go into master first.

It looks like master branch has gcc-11.2 currently.

Both of the CVEs which I intend to exclude have CPE that only matches
up to 10.1:
https://nvd.nist.gov/vuln/detail/CVE-2019-15847
https://nvd.nist.gov/vuln/detail/CVE-2021-37322

So adding them in master branch will have no effect there. Do you
still want them added there?

(Aside: hardknott has 10.3, honister has 10.2)

Thanks,
Ralph

