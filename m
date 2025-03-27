Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90ADC36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:02:47 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.1615.1743094960984245591
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 10:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=crkQS6o+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ed16ce246bso6328916d6.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Mar 2025 10:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743094960; x=1743699760; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Htz+EXsj8sYoLe/XUZAHQHgCAgPWHIV6YOKGf9qO8bM=;
        b=crkQS6o+gR6izQr8NbxSPBUFP+tnh8aO2Lr0Vp5pBfYNpW8+roA+69rbmh6KrR+GSB
         dljn6sixPsOn8hiNTuTKl5lEHFckZFZGo371UpfOoN8c6za/HroS+914rGIN4WQQq4Yv
         jSWTgbieELDGWaHKTTWHfXj79e10ebBD3vAwIDnDpAwGoZiOP3I5dkl04hyoFt6Vrbba
         asYJ2sFW6LIYiG1ER/gaKWVmiEGVstPjmvOXZR4FT+M3XRD6EPfxun323mL9p217KRHo
         lpL/QLEv2866blJFlzbVV2YN5x9S7PS6VrwH+NxoxrOqR41K25QAIwhnUOlx0YWtFzfm
         6pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094960; x=1743699760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Htz+EXsj8sYoLe/XUZAHQHgCAgPWHIV6YOKGf9qO8bM=;
        b=eINgB0WVv6Ro+yln8nROwPK96b4K5VOPy9mbWSaNko2lbj/mAFLIzY6DoLCXQLs9CV
         uX49DDLtyYEIczsfn6/nR/Bt70T7GMFkoQ3xPqhB6d5/WcA09t58AFcKck9W7mRxfZMZ
         TI7Lcts1zdEQMod9NxR1v9nB6nMquxqXD5oJoZEhOEshjgjfJGHOQwfvuInTQoLzl1XU
         T6vptWm0U9+8tbruO4MFIBf7xTRdRQuzB/nIeEwl5OgTaUTFeAEdpVyj1pgNd1HWmf3Z
         3Abzl25t362SnqMDjtVPVmDBK/CR+wGtKOI8PgeSu+i3UDGM5rrLun1qOUxBaR5YoMkx
         T7hw==
X-Gm-Message-State: AOJu0YxgH5i5D1A4I2z4CtWX35N6Nzc19/9p9MarvDTGNqKo/Yr2/FF0
	QcliRh/9jWbP8Vz58sd7UVH93PPde4lk2HDWQdBoO1qVB7grF5zIhY1fqQAolNc0nhgnrD2zZP9
	OxA==
X-Gm-Gg: ASbGncvjO/B7+bUewM7BRvIkRWv/mzAdnkHl4vxwEKuYkoo59wJkOK3juZBnkKJYjWs
	Xy6jPcmlamAf46cqVAG0aW1ZdE2iYoQgmslTVkJ4pS2qmLtS4B96Q+OuJEkLpsCodvFS7vgViDy
	Fxyz5thUM7ZQaZWSggqA/SHSZjMgvj+pEYiLLU0t6uJ9zScrmvIzZ1Hss0HDS45eRPcKZDVvNTJ
	5YMAqk6264FtJNIz0I1OenX3UNXYQhjvT3iuEL9SHb9yLSQdp6bsko5MSdF6DKIS7b8N7axceY+
	JmEdArmxFbrYeEvWB7afPXMX7+Ht2hO0dK3c/SXlmPaHoRQ=
X-Google-Smtp-Source: AGHT+IGi9+bWWPgM81ajFYszqzVx8Rh8ZS5U5lpHycJtx7O3CBzaPALbbDE/rl/4uBu4FnWmzTT09A==
X-Received: by 2002:a05:6214:414:b0:6e2:43d1:5fd0 with SMTP id 6a1803df08f44-6ed2392839bmr66478936d6.31.1743094959513;
        Thu, 27 Mar 2025 10:02:39 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97721ccsm1181426d6.73.2025.03.27.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:02:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] CI: use DEFAULT_TAG as the default ACS_TAG
Date: Thu, 27 Mar 2025 13:02:29 -0400
Message-Id: <174309495119.3447541.532805279759421128.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325175358.2562904-1-ross.burton@arm.com>
References: <20250325175358.2562904-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Mar 2025 17:02:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6418


On Tue, 25 Mar 2025 17:53:57 +0000, Ross Burton wrote:
> This stops the job being stuck if the runners will only take jobs that
> have been tagged.
> 
> 

Applied, thanks!

[1/2] CI: use DEFAULT_TAG as the default ACS_TAG
      (no commit info)
[2/2] arm-system-ready/arm-systemready-ir-acs: add version to download filename
      commit: 9c548d16e099c9981b9b557ef2df4481605ffcf4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

