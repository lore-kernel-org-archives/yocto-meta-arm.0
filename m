Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.33421.1612185170819363960
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Feb 2021 05:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=QVAy0kSR;
 spf=pass (domain: burtonini.com, ip: 209.85.208.175, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f175.google.com with SMTP id f2so19479473ljp.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Feb 2021 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fFLvixn6Enp/SkeVZzVr99TiR/VNWGGNm1eocnbCCY=;
        b=QVAy0kSRrLz+gR+KWwQ7LEiwWD7yRPI26zMW9YIZ3Mp5w1UFtAxGDcPigfEpcbJ3tt
         Ne6v3jLCAhBLX89QYY7XwBNyxQWtUpor5C/gtXRrmXwJQbxDbZ5pxbYMOt36csA1CnlG
         aaJWgtOzNxAYSg+HbLX3lciu47GuMVhPk2oXppux12rZejBOa/Kt82bkoQ4tkTYYr7r4
         r6w328H/968ub3jcyMYULeInyjOvseTVMWpIhUOpO55EySEaRvcnIzYembsiEtPWMlmu
         45FEkOXGRDZhiIakIB60K5EIl8nLy+za18PEmWY888AiKTj7H6/QK6L6ZacFG513BOga
         mM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fFLvixn6Enp/SkeVZzVr99TiR/VNWGGNm1eocnbCCY=;
        b=hbNjsfEE2z8u5Mn27uFM49z0+SC308Ruf1lkEqsSRJQxfjfd8Jtopl5x2P4OIGnn3W
         94saRF1qWtwQPGYOsofGnro1E9iG0m7S4kd0A+TkhOLXdMUXKu1kI+m9UkdWjCNxc5oB
         j3dCDckkgbvsK6gl8WGMmQEpTK7W1vI7+8sDGNcJRDeXitxfbv8G0yvXh4y0exXQtFvI
         r/WN5hMZ8aIRZcmMtsM3vPbaugkDyPIsF2A9wyyuqS9+Rv6Pdz04hqLAwiowqeUWEfvz
         cR8KE6ssvjeZxbS+k4KOe1tFMdZh5Pq2WAh+7Z9XMLVTSD6COgu/5/mKUBnUtZNiHP/Z
         77BA==
X-Gm-Message-State: AOAM530r7qpchvp+nzdG9E1MJK5w6Qi0LY4rK/lYDMz1x3S74wNDtMPQ
	wRU/EKEWVGaSI1pGf6hK2T32ATSykjc1o6cyaDsONg==
X-Google-Smtp-Source: ABdhPJzuC8keQegJW9a/qofBbtcwBfuztD90d7RlQ4LhwKngakTX0/qHiS9Ar6ZOjcyZ9glJhR+rfaTpr/Yo9n54tN8=
X-Received: by 2002:a2e:b1d4:: with SMTP id e20mr10830847lja.103.1612185168942;
 Mon, 01 Feb 2021 05:12:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sox8e6OgAYwzPSinah7kk6YcYbn6HRUZFgd_H5C27Ss=A@mail.gmail.com>
 <CAFA6WYM8oqCJHruVB2eco5y6VddY7nq_P6HyKQVdOEJteXjKzw@mail.gmail.com> <CAMKF1srYuxGAqyHOQ62FhGxAD5Dkp44SY6X3zFK-Bwtb370-Gg@mail.gmail.com>
In-Reply-To: <CAMKF1srYuxGAqyHOQ62FhGxAD5Dkp44SY6X3zFK-Bwtb370-Gg@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 1 Feb 2021 13:12:37 +0000
Message-ID: <CAAnfSTvydZM5HXjJ1OkZ-HeHTMtKN5mVuakXRGf6vzVw8mxTMA@mail.gmail.com>
Subject: Re: [meta-arm] preferred version arm-8.3 of gcc-cross-aarch64 not available
To: Khem Raj <raj.khem@gmail.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Cliff Brake <cbrake@bec-systems.com>, 
	Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

For the list, this is caused by
https://github.com/akuster/meta-odroid/commit/146114a458ef915fc98d9dffbdd397abc7a02558
so not meta-arm specific.

Ross

On Fri, 29 Jan 2021 at 06:03, Khem Raj <raj.khem@gmail.com> wrote:
>
> There are no changes in distro wrt this variable for ages but it does update the layers as you might see in that pull request
>
> On Thu, Jan 28, 2021 at 9:38 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> Hi Khem,
>>
>> Support for arm-8.3 was recently removed [1] from meta-arm master
>> branch and it only supports arm-9.2 and arm-10.2 releases. It looks
>> like your distro has configured the preferred version of GCC as
>> arm-8.3 but it isn't able to find it. Could you check the value of
>> "GCCVERSION" variable?
>>
>> [1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=a56011bf30c86a86c4feb57827030516c37f65ed
>>
>> Regards,
>> Sumit
>>
>> On Fri, 29 Jan 2021 at 00:14, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > Hi All
>> >
>> > We have started seeing this error. It seems related to meta-arm. We do not want
>> > gcc from meta-arm but it it still trying to creep in. Please help out.
>> >
>> >
>> > https://github.com/YoeDistro/yoe-distro/pull/518#issuecomment-769242387
>> >
>> > Thanks
>> > -Khem
>> >
>> >
>> >
>
>
> 
>
