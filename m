Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57ABC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:47:03 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.20166.1718801215197731701
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 05:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ox1aV17d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.178, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfde5ae0aaeso6626982276.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718801213; x=1719406013; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3w3VA5meWUJxOsr+M7ZLY+nFu6zoaWI970xl24SbI0=;
        b=Ox1aV17dK9CfouXfzSGXLbjNDgtlc91SzKXSeKxZV3ZCvNrAYSErU3K3sUP/jqiBc9
         K3H+iTNBsnaWaIomNl88fn0rPwYFx2eJQNFFqmplI/Y5bL8bIyAi+5WTh7QRauqyMPKQ
         6uXKAnL5uURTi4LDIB5RSkEVuV/DqB3OrMQP/gJ2ayyLmKMm5R9TWp+dXEMEL1eyo/L7
         ycZUd74rqJrqI+TgJs+klmc7DEFoFRLq1a9SOQ2JJlLBKEpUTDoPuFOHwzk9XWCyoYi0
         e71w+1Ht+oQdux8DBrB4yn+kSksR1NzpEcv7BmknM0C7BjuhicvQrLAdbGWhUryfcnGK
         TOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718801213; x=1719406013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3w3VA5meWUJxOsr+M7ZLY+nFu6zoaWI970xl24SbI0=;
        b=M+YWegpxI7iXtatvRLvLrMTS0/fKWseDES4lgqc4Z1bEbcjCdyrT5yOEacr1E+d/h8
         GQdyurg7FWJe6eTwP1kt2LHLdIrX9/89ME/d+rtCb7fgKThncaJEiioUUxvJIDCPmVrS
         9OWC5eo+uXDvQBTlqRvo39hrCAjoTuANWDv/GL9BfbDwd0PC2ymz1GefHhfC/BtOvcL1
         7zSYB7L65NeJTAhc/+RorhvVGyuhWfcb5QFm2lAtF8O6mz8mOzJMWdoMfJuqqKdR/ug6
         xFqjJqN+NAjcwaOhewU8bQHsFaqjx7Dua8fz8IMbyEeDKADxQBWES65FMMeeAjDQm01X
         r3+A==
X-Gm-Message-State: AOJu0Yy6fw7SeRbD355IqSW3jofqouo4Vq1V7OYvibCCk8CgzDarGzaF
	54pkDA5JC7YT0XzXdgJB8nErvNsed2xlmo/mIj2ijtHOghLfgDiUMXDx8PFx6absvI0UVKQJaBg
	=
X-Google-Smtp-Source: AGHT+IHnHQWCwf1xWvjEEfRM//f+ZrT4EP7jMKPW2TfWLWqF6+1Wgx7t2vs/nn7ztQrwogiMoubRfw==
X-Received: by 2002:a25:8203:0:b0:e02:b463:39ec with SMTP id 3f1490d57ef6-e02be16ea71mr2714695276.29.1718801213596;
        Wed, 19 Jun 2024 05:46:53 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04876d77sm2648325276.22.2024.06.19.05.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:46:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] documentation/runfvp: use IMAGE_CLASSES instead of INHERIT
Date: Wed, 19 Jun 2024 08:46:33 -0400
Message-Id: <171880119304.2085664.5048375359529804730.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240618143536.453241-1-ross.burton@arm.com>
References: <20240618143536.453241-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 12:47:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5836


On Tue, 18 Jun 2024 14:35:36 +0000, Ross Burton wrote:
> The fvpboot class specifically hooks into the image creation, so it
> should use IMAGE_CLASSES instead of INHERIT (which is global in scope).
> 
> 

Applied, thanks!

[1/1] documentation/runfvp: use IMAGE_CLASSES instead of INHERIT
      commit: 156141c014195c1d48e663ae6867eb307190d4d6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

