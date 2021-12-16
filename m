Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491FBC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 21:04:55 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.255.1639688693946160191
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 13:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=jZcFv7zY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id f20so586225qtb.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LJeKUmy01GdgJmkoFj5A8Zwih4Kqixxrwe7Lo9PD/74=;
        b=jZcFv7zYN4g2ZrUwFCt385wdFsr0uBxvr0HsW4GqXUCJgjLJ940zq908SbH0jxnZ0+
         c7M5U3DH0my1xF+HS16JC46eGonJENI5z8KFkH6T8GfMhsCZET7ukxDD6tPYKJPYPIFD
         FNT1ZuqW2LTXGlY4JHLDbeGUUhGKI1xQk4bb7LWWdrrxZ6+5mvUn87QU7A5QMQ/cvala
         M2tRjtEHjg21aM6NmfCuu9bREwFovsebS4pjXbzpBt+/ptPaXsbbqWym2C/dX6rzGFg7
         Q/0JA/QV2X6FGKN6aEf6Avvz4Cji2JKKiqvuHZny18oGmznMt89bNVTaw9S2yMMruvkf
         ptPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJeKUmy01GdgJmkoFj5A8Zwih4Kqixxrwe7Lo9PD/74=;
        b=EJ6T6clsqJKTookBue6bPs4lSNiKhrh9MIP/r0n0QgnvxX7A1OwDqv2a0mqZUFQeTM
         wZ9zJNcrKAXjyWBD2xegGnXxZrnwf4xM4W4ALk6WsbOY/22pMi6ZlVGiJ99l8sK7MpeS
         0/9gt4/CdFusxtpeufh6Pr9OhKi7/qTu6YjFAfX7ukeWtOoY4RBKoi8w4l+hKPLispLu
         MvDBwfYeAXxvvpvL5a1BgRGhiApK/Q8EH72mXYhzijxL6TTLXly6eczJNFdi/NfdSrEa
         /hJaAHCdAT4RAav/Pmvg9eBUIptvXmtGOY6h5NvqqtkUZBkVV+wB+6E6aWSjxAsPeEnG
         VIhw==
X-Gm-Message-State: AOAM5313HaS+0wc5+HJSBYHXtFhS3RsahHQ6n00PhKslBnAiduM3OKJe
	vBY1SqNvocAm7t7TEC7oVDykwEax1tC4bGKk
X-Google-Smtp-Source: 
 ABdhPJwDomewp4BfN3IPu7D/Jfo10+R2WqmGfvTSwmSzYUF6bOb72VfHBNgMNgJNxHXds3pGaDRMEQ==
X-Received: by 2002:a05:622a:15c9:: with SMTP id
 d9mr2675259qty.335.1639688692826;
        Thu, 16 Dec 2021 13:04:52 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:a1a6:f88b:686c:916])
        by smtp.gmail.com with ESMTPSA id
 i6sm3551414qkn.26.2021.12.16.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 13:04:52 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/trusted-firmware-m: update CS1K bbappend for TF-M
 1.5.0, again
Date: Thu, 16 Dec 2021 16:04:40 -0500
Message-Id: <163968868085.10503.312890699231851332.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211216101809.3239859-1-ross.burton@arm.com>
References: <20211216101809.3239859-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 21:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2730

On Thu, 16 Dec 2021 10:18:09 +0000, Ross Burton wrote:
> Remove the explicit SRCREV_mcuboot as this is the same as the 1.5.0
> recipe.
> 
> 

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: update CS1K bbappend for TF-M 1.5.0, again
      commit: 1c3c71694ea4f9ab6c325df74b8f446d44eff2d7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

