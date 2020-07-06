Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.56526.1594038645399485069
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 05:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FZy3TzL+;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id k15so22431356lfc.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jul 2020 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=86aB8n7qbmTYdASUii26Uvu9vtQ3r7b4E1JKHMT6sfI=;
        b=FZy3TzL+C4XZYMuLHDFYBAD9CwloH5HjCcYJrJCmMS2v/3Xd4GbnD3wAG8hDlaz3C5
         tRS84I0NTAGilwppL+NMCEdD/k2U6Wvm90pK07rSpGzUsg38AWDhoPq1N33WOXR9FAJU
         NldIxfTDkdtfT+xkdSGCFICq+cFGJtP+x621iw6U9ffOaa4Iw/Sc4a145icl9ZxddQ3W
         8YD6umPSY83tCZME3MLHLI8WlFep7/D9W9rciq8zkfEP36C4Um2dHGrkTLF0tL1FnK0l
         aWPEH0tWqCV6gXK6N5J8k1bv5VuiOMSU/+yTK9WSRz5fFzXUHr8lG2GHWRY1eFdBETIU
         ED1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86aB8n7qbmTYdASUii26Uvu9vtQ3r7b4E1JKHMT6sfI=;
        b=ekkJB0i88XrL38ZKgsTORxl44zo9baGE/RJEVhk3knZYrmbO2TIjnk/iJK+n4BzsvJ
         1bOH/tj81r+gckzHkr066yMHLvhNPttLe8N/O70w/wtsZL7MrWNQ71tPkbNvm/LsfiKW
         hbvf450PvBJwuUJPtLZb9JBBpabQsom5RBklZwMJZdRwJ8hQVq6ACXU8400XNSRP0ePf
         su6mSBJUvn3rtDHUoYBpEyoCxxLTSGTcZ6HzldS3AT1SIlVREmXz2aHHye/jMHa7akio
         LM/DYlNZu9rSS3vyywgkUbw0sSUnwPFLbbCCxcBBhWEOi9ql+3XMJLgiAoTpJNepHWRd
         Sblw==
X-Gm-Message-State: AOAM530pmpKL2ypcPy+l9a2Y0dz+hu+hWevPxWbQVF6etHmQWxZpLj0Q
	N0wJvxnLEm9yALC8oeNHYn4mu+SGUpyBkmLPBTulag==
X-Google-Smtp-Source: ABdhPJyUR09g06JyHU+WBPcXryisyYSneexviPOU6uPIvtNW4x82F/f2neyPr6doSt44RtnUol3xwCwbwu8xCD3JY7k=
X-Received: by 2002:ac2:4c03:: with SMTP id t3mr29362332lfq.72.1594038643559;
 Mon, 06 Jul 2020 05:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200703145233.2494070-1-raj.khem@gmail.com> <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
 <CAAnfSTvvrndnMZo9s4RwNLLp8iaB3JHuotKgmNgLQVFJKCdmrA@mail.gmail.com>
In-Reply-To: <CAAnfSTvvrndnMZo9s4RwNLLp8iaB3JHuotKgmNgLQVFJKCdmrA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 6 Jul 2020 13:30:32 +0100
Message-ID: <CAAnfSTvZ9GO_hWOJ2Q7=fUQd3EV0b6bVe8T1SdBCwJtrH=4=mg@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Update: Richard has merged the fix.  Hopefully that now results in a
green build!

Ross

On Mon, 6 Jul 2020 at 12:07, Ross Burton <ross@burtonini.com> wrote:
>
> On Sun, 5 Jul 2020 at 21:15, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2020-07-03 at 07:52 -0700, Khem Raj wrote:
> > > trusted-firmware-m needs arm binary toolchain to build from another
> > > layer, this is the only recipe thus far and its better to hide it to
> > > majority users who may not be using trusted-firmware-m and thusly
> > > meta-arm-toolchain, folks who need to use trusted-firmware-m should
> > > explicitly add it to layer mix
>
> My fault: the layer ordering wasn't quite as important before, but it
> is now.  Testing a fix to autobuilder-helper now.
>
> Ross
