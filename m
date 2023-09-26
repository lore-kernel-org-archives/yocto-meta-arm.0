Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D108BE8180F
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 01:35:25 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.9368.1695692119371322200
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 18:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cttwzo45;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4181462ebf0so22333771cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 25 Sep 2023 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695692118; x=1696296918; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6KrgZKQiw+nbhjUXrtNGRuoWNB8F7STB0/gPzaZzYE=;
        b=cttwzo45buza9+03MfoXqFUkOT3WsK40IjOM58bBck2gBdTv4JMn4nhb4kk3EnqkHH
         yhFRMjidR6b8B9Jx0vqXGEoHRxuT6q1c51DXgVnkWnj46HoI5qIYk+8oVxkUzqtmQbM3
         wzEkXFKEf2mhbA1xfY/aSZNGKuZWgBrqyDNnWPh86t3OLt4ZhD32ZTyEt+l0tHVsnrTq
         VKIv63BmMmtZQs9vd4wfBU5KBR3Nh+5CYVHBzprET+KfS+/KmbpJzLGgDwrqWW1Powof
         bA7lK1R3KOCzU6wGcmRVYeOp9QSgD/JnLCH1uZdSM1WNDIWE1fQENnnoXOxB7usMcDsB
         zkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695692118; x=1696296918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6KrgZKQiw+nbhjUXrtNGRuoWNB8F7STB0/gPzaZzYE=;
        b=BO7O+fykYPfYSSGMqxhR3M7OAThk2uqKEEY+0XKcFWLXyq5S22UBiETHXaueDPTxdi
         fQIsIArdKhy17uOQM1UIl5sX+K0UHTjLm2RNxBclxG0fqYOkfYx0JcLuWe8xoiX+PIlo
         yEltuxOft4FYb1xxZOdOLm29aPTwSRAarrwfgbLs26LaWhFSjWAqOS/FMmTJZa5MrxF4
         uMgphxqAvD2k0GFjA8YcqXQc5+axNil2L/gudr3Zv9Mmzy7Agi9MgTb/IdwFkxeQyi2M
         1mlVyyFLLzVPS7RQozZvofW/zgAi19JZKM0YeePLVz8PAMo0Sqc2Q2etoGDCd5ZQL+m/
         vJPA==
X-Gm-Message-State: AOJu0YzPAA9wzW+xnqeTq//Ix5SnNt7c1YNN5oXlLtXv7quk8wpFohjf
	bWMsIxG0LSXcaPwDiY1oLjLiwx2wirSnyRO7U7w=
X-Google-Smtp-Source: AGHT+IFU8JLQZnpg6Z6HA3HonZ2p7cpUtn0dVHWaf4HcdJuTVwSQJQP+HwnVpdssm1wVRZIPJhKCLg==
X-Received: by 2002:a05:622a:7484:b0:418:1817:43a9 with SMTP id jk4-20020a05622a748400b00418181743a9mr4497394qtb.17.1695692118008;
        Mon, 25 Sep 2023 18:35:18 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g23-20020ac84dd7000000b00417fa7d33dbsm3247555qtw.93.2023.09.25.18.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 18:35:17 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	adam.johnston@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: Fix BL32 path if usrmerge enabled
Date: Mon, 25 Sep 2023 21:34:39 -0400
Message-Id: <169569208201.2956650.13065131776010917779.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230925155140.133001-1-adam.johnston@arm.com>
References: <20230925155140.133001-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Sep 2023 01:35:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5074


On Mon, 25 Sep 2023 16:51:39 +0100, adam.johnston@arm.com wrote:
> From: Adam Johnston <adam.johnston@arm.com>
> 
> The optee recipe installs the tee image using `${nonarch_base_libdir}`
> If usrmerge is enabled this is `/usr/lib`, otherwise it is `/lib`
> 
> Several platforms (corstone1000, n1sdp, tc) look for tee-pager_v2.bin in
> the hard-coded `/lib/firmware`, hence if usrmerge is enabled it won't be
> found.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: Fix BL32 path if usrmerge enabled
      commit: be9bbaa16ed0d60490fb8f915fc48e40d14478a5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

