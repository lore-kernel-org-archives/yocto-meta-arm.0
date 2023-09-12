Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F1DCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 03:58:03 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.17814.1694491072974143033
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 20:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=B41ww+Eg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-413636c6d6aso32725991cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694491071; x=1695095871; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6+HivXvLpUMUCSCp9HJ9N9MMVDoUGLi5cTik24WQp0=;
        b=B41ww+EgYTP0vufT8SpiFjESs9nJkfiNv5i3A84MLGtTBBJRZo012RxI053P3P3HY4
         N7K9ARMu9pcLhU+GZg8vcINa/VpsqWYjESk3YuUrgNnbw/kbPTgtzZ5EF7sTWJZnQiqZ
         Iyby43M6tg7kzDZsdpzNfi7wxRazBycXFG7DnpJXnLCWPEJcSPNiZabu2iPErBDUvqq0
         dnyOSIqqJt1hRGLZ9Mjq2eH6dIwkZDs9s66TYb58jKXVdqyPDofEJOMbO1yoMQWQzfGP
         sxfJY/y1SYfcQrBMbg4uvT0CnafvBouw/H+rD2T243KQDTWCmHSSAENYNGXxBLuV5SiB
         dKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491071; x=1695095871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6+HivXvLpUMUCSCp9HJ9N9MMVDoUGLi5cTik24WQp0=;
        b=k7rUzLOo4IIsLlRGWKTPyYu8GPBftcyBbRSwLRhaf/ITyMhUO3QRcmlLHa8D+ljz51
         kvLZXI5l0sMbq9JEuyTLOtFsUljU5XPxEn4Fckn4k4RKbfvQEOor+5++Fcgh1Eoobejr
         aPcudy+nJJnYrirRzp8LIQTThJeQipyjwaTbBsN9JUMHrl0Ti/YLDxdo7axRRspWkNrj
         VRJJEo3MrCk3XMS8S9xrc67oD6JShyeuhKUzhPV5oksxy8mTk6owBoBIah9aQbvBdn9U
         PtiVBpoObQv2dUoS+zELWiPGG2pY/5CK4yjWidItw+/KhveZxVg+FPo8NGP8hJJF9uA/
         mh5g==
X-Gm-Message-State: AOJu0YyANQgNY1ML51DQNEY/t5KlZlPTwfsiUWAL/GKQsGi+HQhLwh3N
	iVKfmIZitPKpB+NzZmrw2NUh5BsVh4OPskmemZY=
X-Google-Smtp-Source: AGHT+IHxL9P7JFFPBIlWX4R/AJFXKlYqtSbOJkjkzd4AQr/y5rkFT6mLtG5hjTariHurt286nrd6xw==
X-Received: by 2002:a05:622a:550a:b0:415:12b5:73c0 with SMTP id fj10-20020a05622a550a00b0041512b573c0mr9850250qtb.32.1694491071672;
        Mon, 11 Sep 2023 20:57:51 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z24-20020ac86b98000000b00414e93d940dsm3061721qts.50.2023.09.11.20.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 20:57:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
Date: Mon, 11 Sep 2023 23:56:36 -0400
Message-Id: <169449099945.3039896.5891146895351700571.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230910163550.3900070-1-martin.jansa@gmail.com>
References: <20230910163550.3900070-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 03:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5035


On Sun, 10 Sep 2023 18:35:50 +0200, Martin Jansa wrote:
> * oe-core switched to nanbield in:
>   https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6
> 
> 

Applied, thanks!

[1/1] layer.conf: update LAYERSERIES_COMPAT for nanbield
      commit: 2d809a7c3511b9fcb71f1b264184e7840a378adc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

