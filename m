Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBBDCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:09:58 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.24387.1694524190638961681
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 06:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pku1KAj+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-770ef0da4c2so226490885a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694524189; x=1695128989; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFVcMZ1Jj7K0lHh5R8km2Eyv/MlYZyX9H7ouVnkazV8=;
        b=pku1KAj+oyFzf15F/ZnKuWpJivBdigpbwoU0/473QMwGUlMG0vR+Cy9WdUCZYbzveE
         IMLqhVGOVN0tEdlCvGzaJ5qppYnIzFNkANNNtj57V5I0xPrrimcJ34p39L9nJ5iIc4i5
         bcZKvE93jE9bQYRgXqqU1r2Lo8lO0DccfsLJd5hon5t0yBqd1j6hguWSPQgVahw0/CvO
         wvxZHMbjbKRmXUk/VwfxLpMG3f/+9DGZRqoO0u24+Frw66VbuqbhKnZeM/THbESyZXBu
         hJhFyUOrCnxAfMaY6jiQ7rwv9JitcwmYOuTTJjfzcroLH8pmgDRbN+k1rsIer78rbPrf
         3XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694524189; x=1695128989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFVcMZ1Jj7K0lHh5R8km2Eyv/MlYZyX9H7ouVnkazV8=;
        b=f6es0MwK100rZB2bOgiJ3dy8Jqa37dPkFY5QMyjlIHEbb7l5KLqipNuqcbvvy4qowi
         OLea5M1lPTOBuuVhwScMEUwh5UfNffwJlSbYf3YsAF9W/caKK80naFW8MyV225bQ7A8L
         sIIgP7RgOuKTPdxXN5dYg0cC1P+tNBRGv6uZk2fNm0NHXb5U9oLrBoN2p1TvR+X6n65m
         noXBj1DXvLb9bmxe1LpoHbYeebWo+pHwpG4OZWu7Yj80Os58xC5kDFFIqGMj+AnBjEcJ
         DHQR65838vEEK/zI0gbXlgfarXrnLtF82SghUP2/7XJuPaA2sgnWZYkijREr9ZXIXMnE
         NiOQ==
X-Gm-Message-State: AOJu0YztLoRt06GSp6d7g2FFwTQBQtUOHxBN94uSt4dFlX7U1493wiFs
	s6A5012oM+dKzw7HYnEcCOSZ5w==
X-Google-Smtp-Source: AGHT+IGUjNQaRKj9U3+1yc+njx4WQt+1jY3uWK6/MreVGyS3FwnrrHN7bjq1GWTFp71S1WzhLKSnmg==
X-Received: by 2002:a37:e30a:0:b0:76c:a911:f75f with SMTP id y10-20020a37e30a000000b0076ca911f75fmr11108588qki.53.1694524189670;
        Tue, 12 Sep 2023 06:09:49 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ka22-20020a05622a441600b0040399fb5ef3sm3308124qtb.0.2023.09.12.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:09:49 -0700 (PDT)
Date: Tue, 12 Sep 2023 09:09:42 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for
 nanbield
Message-ID: <ZQBjFlgAnfF06L70@kudzu.us>
References: <20230910163550.3900070-1-martin.jansa@gmail.com>
 <17840AA742C25184.29005@lists.yoctoproject.org>
 <CAPoiz9wn0kQdsVogYJn-e5ApkAiw9G+2OxR_UCOTFxTaV7egzw@mail.gmail.com>
 <20230912041647.GF3359@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230912041647.GF3359@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 13:09:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5044

On Tue, Sep 12, 2023 at 12:16:47AM -0400, Denys Dmytriyenko wrote:
> On Tue, Sep 12, 2023 at 12:01:50AM -0400, Jon Mason wrote:
> > On Mon, Sep 11, 2023 at 11:57 PM Jon Mason via lists.yoctoproject.org
> > <jdmason=kudzu.us@lists.yoctoproject.org> wrote:
> > >
> > >
> > > On Sun, 10 Sep 2023 18:35:50 +0200, Martin Jansa wrote:
> > > > * oe-core switched to nanbield in:
> > > >   https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6
> > > >
> > > >
> > >
> > > Applied, thanks!
> > >
> > > [1/1] layer.conf: update LAYERSERIES_COMPAT for nanbield
> > >       commit: 2d809a7c3511b9fcb71f1b264184e7840a378adc
> > 
> > Actually, what was included in meta-arm was Khem's patch, not yours
> > (though identical patches, his was the one that made it in).  Weird
> > that the b4 tooling got confused.  Sorry for the noise.
> 
> And I was really wondering about that - which one got in and why exacly?

This patch was never applied by my scripts, either because it didn't
apply cleanly (doubtful), the git repo was in a weird state when it
landed, or it was simply never seen.  I'm guessing it was the second
one.  Khem's one was seen and pulled it.  So that is why that one got
in over this one.

This probably means I need to revisit the script and make it a little
more sturdy.

> 
> -- 
> Denys
> 

