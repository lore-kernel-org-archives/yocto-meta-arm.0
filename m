Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.8985.1589448974257466476
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 02:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=QgNz6d7h;
 spf=pass (domain: burtonini.com, ip: 209.85.167.68, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f68.google.com with SMTP id 82so536679lfh.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iBs6kmDLrEegKk+PC18k5OTWWai6RmwmhHhoHGMRtCI=;
        b=QgNz6d7hygucupo+0GyBuMmqca3W9ZkOgfrisNu/aZwJT4+dVHimXyFEeaIiisQ/Zm
         NHkvoZ46tfbyvCj0FEuCZA1WTQksQr38GgAF4Z6eccDEpcqhrlFndct64UcPLOXNoudN
         BaBGRynMRmrH8D+p5amzNkzBCHUfICJb0FBpAFhrVe7s+itSvU3LcJ2ydrmUZ1bXZUM0
         PDl3z8/wkHXzWLFS9K7f4ZqiPY+pjJke4sr4EgGjqUZ2RWzelPsOsrDCWM9pmoH8dROf
         VTyfk1PlEIrRyAjL9KLTV/Y3G8Z0FrtnH2pLzm/4PxkLBAHUPdJ9VqZ4W1vwRiaLqmWu
         Bakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iBs6kmDLrEegKk+PC18k5OTWWai6RmwmhHhoHGMRtCI=;
        b=fLK0bRV6EXpONEEgtjdTKYBRfw4RuZzD4Xd2NYbS6L7/DJvMSEG/9mV60N/VnEw/KJ
         7R8A/mYzd/gS8hlnF5z2ZVZW2cYsmFd8ocuDgr7LgK29TzwhJ/vfrg6mAQK1s1HPZqr3
         pkbZOWpwZr0SqsWx2bm5/rM7FKVarPSrqEfLG97B8Sv5zZSwfuNwgaBv64bQ7T50BP3M
         vEm5TW1A+OpR2wgLyrM0XDyLJAgmlTRnP/pjO/fVU2dn6yQNVPVMGJ3FTlZGuwaV+lbU
         80x3599zVDndY2BGHfZwuxkRhCfljOfaPFL7MQQ4WpKzDj/z2bkvDYgXSH3ht1Uqhitj
         Rv+w==
X-Gm-Message-State: AOAM531N9o8fDCRPsKb0gSbbZgWsodFTSkl0zfRhVCP9+30ARjhDz3tc
	cO8LNbUGjtDq8y9T5nSBjVRZlFV5T9/GMHycCMAakw==
X-Google-Smtp-Source: ABdhPJxhDYLJYTOSaNWnNmAYtF9//zhPigDdBo0c5wRFbRLmwUZkOFs0S84ioWmWUmINM+rNoXIUBdjCDcY9wyZcGyw=
X-Received: by 2002:ac2:5ccf:: with SMTP id f15mr2676962lfq.216.1589448972422;
 Thu, 14 May 2020 02:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <1589412620-56223-1-git-send-email-denis@denix.org>
 <CAJdd5Gbd6Sia48u64zYNB=f0cDNcFy=-oQ-2Y60YbjS4MXy3yA@mail.gmail.com> <20200514000436.GW11927@denix.org>
In-Reply-To: <20200514000436.GW11927@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 14 May 2020 10:36:01 +0100
Message-ID: <CAAnfSTsOSYGNynYjQK3Y+6KwaLcCiKxsCQ-6JdiN-dibMVXwTQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: support multi-board platforms
To: Denys Dmytriyenko <denis@denix.org>
Cc: Joshua Watt <jpewhacker@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2020 at 01:04, Denys Dmytriyenko <denis@denix.org> wrote:
> > I noticed you're doing the Boolean index trick. A little more pythonic and
> > IMHO easier to read would be:
> >
> >  "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
>
> Hmm, I saw OE-Core using the Boolean index trick in bitbake.conf and other
> places quite a lot - I was just following the tradition.
>
> For me personally pure pythonic is too much of a brain twist - booleans,
> simple arrays and such are more natural for me to understand... :)

FWIW, I'm ripping out every boolean index trick in oe-core as I come
across them in other work as they're really not Pythonic at all.  X if
foo else Y is idiomatic.

Ross
