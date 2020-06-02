Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.10469.1591104282148632498
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 06:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=gm0DuZf1;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id z18so12515937lji.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=50X9hzbolj/QE3pXnyuHJZXO2iWM/SaQ/E1/gVkHaQw=;
        b=gm0DuZf1XOIYZXxzWGJN9HU2LESRuyPYGDoOudqSOnZTw0tYAXpeNdOfU1S5zl1eRL
         EHkHVREBGilPSJI5kNCXC/0HOyPCSKdzAw6FwgK1749nZ0Jaf1bp3O9bQgZGeorl9oMc
         +9G5o5QU3Z9vQUniWrwM1NFeliXm78utcM0LF+GD/ORCSe9VYIFZrVjMEvPU0v6myG5j
         ujfy7J6Tpu8p1Asi3ADq591UDPlrHhnTjrnbTxWhqEnugVPaB6FrMgGg2k54ynrl+pbg
         qrUNKZp56yKiUQjRJgNoeFp20IShbl0eVm9ZB3d/VnMzaj2XACdpnHrxpG+0B+NxL4Lz
         3dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=50X9hzbolj/QE3pXnyuHJZXO2iWM/SaQ/E1/gVkHaQw=;
        b=BRynGbB82PorpmVv4Ecgs223SrjMS7XZZfun6k3reycgg/rDNrghpZr3MyFi2ZdeiT
         4dNxBnGnjLd07eWm2zdc7SuTQ+F93yK5UNF7Avjwrtraw5f/t4Zjv9L4xo4v54rMElR1
         czcOXdIjoaYQQtqNvhjuYHiqHXqshecm9m93sWi9fIeoZ2zV+9MGaloUjZbLC5hu62Mq
         /8a33F0O18AnFG1n03JW6Cie/k9OlF82rG4iCzf9RIc5Y41lvALgkW3TIJBrtmXem0KU
         EXK5yo8OWwDZFlzEKOAhH6ld1Xn9fD10eZ51W059XKc2M4NO9q76QQb71bnGo6G+gA0y
         EEuQ==
X-Gm-Message-State: AOAM532rLdjDubY5EMf+n/MfO+7c/idC6k7YgUcGA2WXMx5DGI1ICVPq
	R3Q/WA29CscOldE1lJ58lCt3XIR9zCesVfVQDpv05A==
X-Google-Smtp-Source: ABdhPJwQR9579tgCHAnHeHtkLjKNNZbt/hN8I5KHshaV3qui/H+N6PZjuMScBrJcPckyN3zbBbwIPoH0DnHjzhxb2/c=
X-Received: by 2002:a2e:900a:: with SMTP id h10mr12676360ljg.329.1591104280181;
 Tue, 02 Jun 2020 06:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200529151427.20272-1-JPEWhacker@gmail.com> <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com> <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
 <20200601213141.GA31505@kudzu.us> <a6576f43-1722-3f32-dbd0-3d4ad0dd346f@gmail.com>
 <20200601225610.GD31505@kudzu.us>
In-Reply-To: <20200601225610.GD31505@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 2 Jun 2020 14:24:29 +0100
Message-ID: <CAAnfSTtx7cRaDJaMqwHaG031-BshfqoUFKVL7CA-9C7v_mM2pg@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
To: Jon Mason <jdmason@kudzu.us>
Cc: Joshua Watt <jpewhacker@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2020 at 23:56, Jon Mason <jdmason@kudzu.us> wrote:
> We have a requirement to release BSP SW based on YP.  Just like I
> would expect other vendors/people who want to use meta-arm.  So, there
> are a few ways we can approach this issue.
>
> 1.  Merge patches onto dunfell branch
> 2.  A development branch based on dunfell
> 3.  Use master meta-arm-bsp and dunfell branches for meta-arm and
> meta-arm-toolchain
> 4.  Keep master compatible with dunfell
>
> One is simple, we actually do our development on the dunfell branch.
> However, this breaks it from being a stable branch.  So, this is a
> non-starter

Especially as meta-arm is a new BSP that is rapidly growing, I don't
think we should rule out #1.

To expand: meta-arm master is compatible with oe-core master.
meta-arm dunfell branch is compatible with dunfell.  Because the BSP
is in active development, and because we want to support the users as
much as possible, new versions of some recipes can be backported from
master into dunfell.  Probably not every change, and the impact to
testing isn't negligible, but in the greater scheme customers being
able to track Dunfell but also get the latest software is probably the
right balance.

Prior art includes other BSPs such as meta-intel. The master branch is
tested against master, but release branches also get selected upgrades
such as new kernels or other components (media components, etc).

Testing, now, that's another discussion entirely...

Ross
