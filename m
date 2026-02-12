Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1C9EDF02C
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:03:01 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37381.1770868974436883492
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pVohtuGZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5028fb9d03bso60023451cf.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1770868973; x=1771473773; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdUCy5OuaLVHYEjeapRZNN4V457CH69rzzXvF//r/GU=;
        b=pVohtuGZlROP4uap93WIT0rd7K+Wj4VuDbofBZ/mv6o+sutcDp91vQmCcr5AsLCyd4
         cMvL2AlpFskVeK5beJOSU6hVHJWIHK9fl/JINInkTD+iQoRa+lZ1e1QAFaYunMyvQPUN
         X1Hz+lrGXaGpAZiznr19SpOTbwfbZ/2UjZcTC+DZquNT2hT8TcroH4cmPubxPdji5/+v
         /1UnGMGjYUy9KqKikF8oyhg5rgzqpSOJeZ3veb6ZJm8rUyerW2/CQ/NhTH/Im/l6eYes
         cILg0sppXyWElW0AMQt0INBCh92ckie9DKYadHEfqWhFpAryv7vm94MuvWB75VCWgcpJ
         DqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770868973; x=1771473773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CdUCy5OuaLVHYEjeapRZNN4V457CH69rzzXvF//r/GU=;
        b=s/rAqrOfCy3Dvs9Jms9uRJREbVnsbsba1Y8kCVSnlmhW0XMqckFN7+oo/9yDszEECj
         0PSeWqXP+o8oV0hjexchaUxRiP8CLsdsv1d8uyiYkl7eKI6nAme7599JF//UIO5VPC09
         cshk0wtDHUiP6DsBRUkEJrDfO4S9mOsRy37XvdPnAIo2D5xbfpeY/wD1ZueffmXf16kz
         jbOXHa5lmeMPEphZ01+TNhmAi23vCY4a05PWfdGfO6UIYfFp77RfXHGfq9DDKkJ/IPjS
         ZwkcUIaOjVkfSuMAxdcnZtVwycwtx9EtlGPfmWmtm+HisIRzD7RhRL2IdV5lSO2xSwY1
         Otrg==
X-Gm-Message-State: AOJu0Yz8Vi6ilYKEcEOjV1ZJ+sTq77vRNP4GF6sgr4B1ClIiLJi11yMg
	l9avQQzogb+mtMEteFKY45kXwsV+kaOW9zLPBF6keA0wiL71mtSLH7DAcKHCX4pkw1weqLEuPPZ
	6RKo=
X-Gm-Gg: AZuq6aKA0YPdjyI/C39tLH4QBIFI8ZsX0SBHQ06yDbUenH3aObjgMXQLtNlsKZiHR8G
	XkTcrtxeSGpv3dUHspDs8kvcvrzxj5MAY/K9onuqZmBPBexf0hmooUQo4kC/JrT7tq8PMMs32nY
	hKhUrWjTxettnWLNEwnYwWHGmuyu2gceq6z/tkQhmZP9R2Z7Ur9P8Hnl1pdFBSwWyTd7jbgew0G
	Tx6A23mUboJ7153ap2CS0mQB5l9gB7I9CkTtk1/yFGBBl9aX6teNwxH3bps9+6737kyzfKEXWjX
	CNhAZnlj66l95C/i0YSgjqrr6V1rd19QHbg+G6geNuRJBFY93LynnJ3geNybNQ+PdT9Ua96x1AN
	vzRaU9f9Xvr7nsz8cdBjuLWLvTVnyJu9pkXbaIBHvV44IJOmSVGSAlpJGHzDdota9pylyeKRaRh
	gYlyMm3Uob+loT
X-Received: by 2002:a05:622a:110c:b0:4f1:b714:5864 with SMTP id d75a77b69052e-506919fd0f1mr22234681cf.0.1770868973237;
        Wed, 11 Feb 2026 20:02:53 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506847d78e1sm31123511cf.4.2026.02.11.20.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 20:02:52 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] CI/fvp: made the default target core-image-full-cmdline
Date: Wed, 11 Feb 2026 23:02:29 -0500
Message-Id: <177086895276.770080.9081986712264915538.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260211155809.6450-1-jon.mason@arm.com>
References: <20260211155809.6450-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6906


On Wed, 11 Feb 2026 10:58:07 -0500, Jon Mason wrote:
> No need to have the full graphics stack for FVP images.  Slim the image
> down by default.
> 
> 

Applied, thanks!

[1/3] CI/fvp: made the default target core-image-full-cmdline
      commit: 832ce9bca33a30a094932ac273fe79758a8fe485
[2/3] arm/corstone1000-a320: split off FVP into a unique file and add to CI
      commit: d8c879b9e3fc20728310b45a559bf439d73711fb
[3/3] arm/fvps: reorganize CI into segments
      commit: 98b105ce064a149bfb09395d9dc414935c820ca9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

