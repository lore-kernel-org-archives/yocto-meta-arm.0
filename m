Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web09.16555.1603305569391124100
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 11:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=J4rBnSyy;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id l28so4342036lfp.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Oct 2020 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LmcKjo2EkClEP3HxYEv7CJuinMl0aVXH0jJeSReYuRc=;
        b=J4rBnSyyTCeOvYhrLw8KlVd0trwXKMLSCeIoymtLfuGdSJF64OW5SCBfJMBlBy8Jod
         wjIzhTAv/fyfUdEttde/NLX4EENyXtRKqkS3Fca1aSGGHBkCqJWz0C5cCNad98he7ezJ
         8Oc2eugTDV2cqQ7UR7aS6zADSCe5boL7S36Z7mNlYH149z31pEmYcEh+xms3eWHjhK/+
         hg2ZFOoOVXe6f3kWqC0PM+KAF9UO8sY3zoBoDBv/Jq0qPt7fl1riXpOuIGgbdKrdUuhQ
         osztkFkM6Bkt8epbivv4kWG6LSjMTJwKX3ToO4Xp2Lfh77AJ7HJzhfi1oqNElxfpVwb5
         qcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LmcKjo2EkClEP3HxYEv7CJuinMl0aVXH0jJeSReYuRc=;
        b=fcupgyr/luFTBJrSK+NXA52kR9hpIjIlXP8U3Ztyz3CO4e4WfE62kjDk2l1gfoDf25
         Af2arv4NZ4O/nJRURBuQ7tvNdiuQMCxV55PkhfQKY56xkOcIttHjJTGaO+o54nwOclgk
         n6Ete8iLLWwt/iHBTBVnvvB1o7Pf4K1pVnsgnjLOIPuI5ZGj/0jQB8ESAiEmWNWGcAZJ
         IHg+B27GJuwtrRDW4Gfim4J2L2GOkYvKLvPSAYWxEvZGLNOt1HDEoOpdwf2oB3p3z4Ai
         5RwR0/9+XuQh4ux4kL8Ht7BlewT3CWJFCJgCHxoR6Ap2EgUKUGQZzurnsn5fU2pUY2xo
         ep0A==
X-Gm-Message-State: AOAM530SYdoKm3MGms3YKp4e+8s8IwW8qPY+52HE8D49/Bswdu9+rswB
	DYLG+GomYfWZmVlEyc4aRCQ2+8o59L8UoDkDY+HrOw==
X-Google-Smtp-Source: ABdhPJypBg1PCEhccZ7zBpAsTtixGGcvuKODrZnTZUoX7dEdhj7+5QCywIyLTN9mAoK7POgN2t7yiWEvg8XtYzO1AxM=
X-Received: by 2002:a19:7018:: with SMTP id h24mr1853728lfc.252.1603305567451;
 Wed, 21 Oct 2020 11:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com> <20201021172340.GF19155@denix.org>
In-Reply-To: <20201021172340.GF19155@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 21 Oct 2020 19:39:16 +0100
Message-ID: <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
To: Denys Dmytriyenko <denis@denix.org>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, meta-arm@lists.yoctoproject.org, 
	Lakshmi.Kailasanathan@arm.com, Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2020 at 18:23, Denys Dmytriyenko <denis@denix.org> wrote:
> > +PV .= "~git${SRCPV}"
>
> OpenEmbedded convention is to use "+git..."

+ and ~ have different behaviour, so the question is whether this SHA
is before or after the 1.0 release.

If the 1.0 release hasn't happened yet, ~ is correct.  If 1.0 has
already happened, + would be correct.

The lack of a 1.0 tag suggests that ~ is in fact the correct character to use.

( 1.0~1 < 1.0 < 1.0+1)

Ross
