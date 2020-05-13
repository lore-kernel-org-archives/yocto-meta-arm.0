Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.6159.1589377315063469261
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=OwOGMvf/;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id w10so7125296ljo.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 06:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWf4054bD3PAYeG3/NKopU4JNXFePwKyqa56lEaHt6o=;
        b=OwOGMvf/vjYT2xBDZ6PDtxvGdH6plTMWefOOxmajCP/RaXEE8tqm09A9WEJsmj/EXo
         1/gdTjiD+8qdEyQ3W9QMnUW6zsK6Jr6JcFc++j9QcGscaX1yvAqmDif04BZVP+BBfoAL
         CP0O/YSMbp/LpOIwrXj1pV9Ow2B+u+lVYvZ8Aj8ISFE8TRp+haHOgDewcNg1AoE1ekyd
         +IL5Q4J/oYgQgxxG6W9M0JfCCetFNiUuBDUTxg0WLu5Wtg4GvbV9wlnxvghGOtei8Trg
         qaZe+pFZ8ADNWnPLR8KfGzgvnZE9PsMzX2KFYRf5sRIAgIhZnoJgU3/HrueuvioY7eeu
         R8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWf4054bD3PAYeG3/NKopU4JNXFePwKyqa56lEaHt6o=;
        b=lwcb/AIA6GmawDdU3BS22E5gKaOFoqIOyMaTafW1HMNIal18zfv5SkrzpMTGG9nYUS
         2IAGTTnP2NBz+T9U3Hye+fMeKsbTyE0YWqJGgqWhnQSPky1YkOezULJhnU1mcEnFphuk
         5kttQMwpJX0s12FyytYwm5KrWnfmpSxa8nOYa1DK3Okso0e9cpwlNyIDAhq8mRS1NPZa
         S/dRLCZK78ssvsLvGD41Eu5d+txDuja1JOMLURYR7uioUrOpzAod6K/J2w3KnhfehOkw
         R4L9jUJDO4L92vecoodYlUg/gKOFFYhIr7kNUIbuMPQmMHBNzUU2w1732hMzRfsBJZQ9
         NKcg==
X-Gm-Message-State: AOAM5333U3LUoXvD+ayXbosSYyyRoTHXVbw7NQk1Tdbhu2l3IZKVnWQQ
	xijw5uFGl4R8BnHq2DMOBdxDKkXq85EWpiV0TKu8HA==
X-Google-Smtp-Source: ABdhPJwhL48E8/DoBF4uUZA5aM5qlHy4hk5p8A0a7XYPWzVTA/hTUBmL0+wVRKb3VxL3FpkevzVh5NmjgUE/wsdLEmI=
X-Received: by 2002:a2e:a552:: with SMTP id e18mr7254255ljn.162.1589377313262;
 Wed, 13 May 2020 06:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200511142604.11860-1-JPEWhacker@gmail.com> <20200512211219.19262-1-JPEWhacker@gmail.com>
 <20200512211219.19262-2-JPEWhacker@gmail.com> <CAAnfSTvCvLvO_8cPMvCkCkN7r5HxMzR2TPx0aqWkS2WY9JPLYg@mail.gmail.com>
 <AM0PR08MB39876358C6145076A5ED500192BF0@AM0PR08MB3987.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB39876358C6145076A5ED500192BF0@AM0PR08MB3987.eurprd08.prod.outlook.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 13 May 2020 14:41:41 +0100
Message-ID: <CAAnfSTvA+FLddt6AE2f9ASYod7GvqXezxpP+XvS4YHNF5s=kHA@mail.gmail.com>
Subject: Re: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2020 at 07:36, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> > > +B = "${WORKDIR}/build"
> >
> > You'll want to do_configure[cleandirs] = "${B}" too, right?
>
> Since we have do_configure[noexec] = "1", will this work?

Good point.  Probably not, use do_compile then.

Ross
