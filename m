Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0A9C3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:41:52 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.9469.1720795311306225143
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 07:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=IK+rLbDB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso2212303276.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720795310; x=1721400110; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Au1rAMcKl82K3/Z6emlKGV4RSykgmThhWX7waStu3DA=;
        b=IK+rLbDB4/Jds0c2lcAqpUBnjTOhhZ4mpSeqzMpLriDUKTGNBHimgvtP8f9RdG1cZj
         PXXFZFzij1mV5xxZkeeJZh59v3vn5vryBzsSDnYGvBWZ4a8Yw1PcTi7MEFcv1h08wmKC
         83PA3E3OVILycGhxtFUJHt6rBQ6/5BpcLsS55vbxOYTvUE9AnoOb0RNDtCH8Rm4WryUQ
         hGVcBEuHeOdo9jWlhgijdlcgHewp/5/Hb5j7hbU/ZvL/v2BCClrmiuCgHg/VJVNEkKgj
         aYLj9lW9GEYPiiYVfFyWjsEzix+Xn69rTAwBBfk5BkUmIC4oE/A19oclYkuU+A4e/jpF
         +KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720795310; x=1721400110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au1rAMcKl82K3/Z6emlKGV4RSykgmThhWX7waStu3DA=;
        b=k8R2t6dhSg0Qd3BpP8OKzMKoliA4xmN43l02dZwMu9dGP98HWiVMtZqgcm/66Clvw8
         uYYVhkU9tTOKacg8e5nVl93wMwPRFQiGNGkv13NW3ZRYxaQz9V6tezRP64vmEOqKhG0h
         HTa/eND6QhQzlEwbCBTnATYLyZqq/QciX+LkG/2iycq0yICoChvw0fX4shzwV7zb95sg
         L9hTZBAo8afYLyXuakIxf1A1PQ1i8okHjE4RrZa0Awq+dGpoXPB1zUmUDCd3FI9kWLVx
         iHNGqXS6f/KMEHignBVqRdzZTVGMq2RrN5lJrxvMAUoN57+QJoBB5m13xHTHa9wJFMel
         SPMg==
X-Gm-Message-State: AOJu0Yyppb+7VXw0aUndPLiNh//Y/LPbTu+0YDbTa904BpE5i753c7VX
	zfO0BoWtvSVlvWLyryFSCpEyaFx4R6i/1I+TP/IC9FT08gXlf0JY/y/8P4oy5g7AdQ/TW1MCjWk
	=
X-Google-Smtp-Source: AGHT+IE9HM3g7Tx10qgVDEYno1xEFIh8TDRXaa5R0tZmjqI+JlIycDwZlrYJnAxi7unrqKg4zpEXAg==
X-Received: by 2002:a25:c502:0:b0:dfb:3bf:f5ce with SMTP id 3f1490d57ef6-e041b1e81eemr13563419276.48.1720795310276;
        Fri, 12 Jul 2024 07:41:50 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a8f58d2sm1294728276.33.2024.07.12.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:41:50 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:41:48 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Gerd Kautzmann <G.Kautzmann@primes.de>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: RaspberryPi 4 Scarthgap core-image-minimal
Message-ID: <ZpFArMKi5gEN3G8b@kudzu.us>
References: <1619D009AA8C9E469331A8EE22395AEC01106D19C0@Exchange2013.PRIMES.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619D009AA8C9E469331A8EE22395AEC01106D19C0@Exchange2013.PRIMES.local>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 14:41:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5885

On Fri, Jul 12, 2024 at 08:09:54AM +0000, Gerd Kautzmann wrote:
> Hello,
> 
> On Dunfell I used the command
> 
> sbin/modprobe i2c-dev
> 
> in my startup scrips, now under Scarthgap I got only this reply:
> 
> modprobe: FATAL: Module i2c-dev not found in directory /lib/modules/6.6.22-v7l
> 
> The whole folder /lib/modules is missing in my build.
> 
> What should be added to get back all the missing modules?
> 
> 
> PRIMES GmbH    Max-Planck-Str. 2    64319 Pfungstadt   Germany
> T +49 6157 9878 0
> CEO: Dr.-Ing. Reinhard Kramer, Dr. rer. nat. Thomas Umschlag
> Local Court: Darmstadt HRB 5134
> g.kautzmann@primes.de<mailto:g.kautzmann@primes.de>    www.primes.de<blocked::http://www.primes.de/>
> 

Hello Gerd,
A lot to unpack here.

This mailing list is for the meta-arm layer for the Yocto Project and
OpenEmbedded.  Your questions are not specific to anything supported
in this layer.  So, your questions would be better served being asked
on other lists.  For Raspberry Pi, there is a layer:
https://git.yoctoproject.org/meta-raspberrypi
and it uses the general  mailing list:
yocto@lists.yoctoproject.org

I'd recommend you email that list with your questions.

I think your issue is due to not having the kernel modules added to
your image.  Without knowing you config, you probably need to add:
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"

Again, you should ask this on the mailing list above.

Finally, Dunfell is EOL'ed and no longer supported.  See
https://wiki.yoctoproject.org/wiki/Releases

Thanks,
Jon

