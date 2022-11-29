Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06A4C43217
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 01:14:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.137180.1669684481849350804
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 17:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=1fgh40h3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id x21so8738747qkj.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Nov 2022 17:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJZwT3wwOVe2j16AWWHstkdYzj6xOrztRDSjx7nrvww=;
        b=1fgh40h3qtEcLfNWz0XNLPgn0xlxFToRZW2Huyqqf5tRm7LgTomcA4F08hTzIUh/7y
         0lNlY/i99/JVbnTue6Vzq26gavmD9byeqskXKIUtIXSGDxUrBFBvWZJmY3ShVDELL8KF
         zzut2pyRKjsJ0/rCcuAcDPX7nVAsp/T3pIUuCMeR9joZlhMqGm6IsSUG4EVT8U7dEp83
         7s48WwJzqcXErrqb3u83aosT4I1riq8VuF+BopGEpMlL/gRBaukcGMN/CVucaR7vqNle
         bY/DaH2HlxG5mSF/4q6EUCC6M7mQWfJBZyct6biQbLzgPCb4E0awtK2DTFBOT8jmtfTl
         qm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJZwT3wwOVe2j16AWWHstkdYzj6xOrztRDSjx7nrvww=;
        b=nT6hTZ71BfGRKDG9A2NVmI6NkVeG8KAxzYvXG1zf+/Ly66DGFhFuWUZHlDQ3kBGGwI
         cB59hL32K0tYYh3fAwfQH3GCovr7L7EySJDClZizIMaC+4T5+onYM5u7gHX7fTkvKTOv
         qUzyp6yN131EsbWniMyzE/KC2uSift5yYG1I32GkQuQiFmlO4PhxBZhk3tLHNWBLvd0a
         /6tAEKZGVTRCUXodFVSTJHV/eFWcVaZCXaM9gUASOxYF0F4WkIefs2B7sH3l9Lag1Adr
         qKGQrCF44raCl31PAuNEpUqQjtmTzgrHi+9nOpvRTLBsVnFffzT3j78HT1hmGfywX1WR
         45WA==
X-Gm-Message-State: ANoB5pm3Vx4pA2X+FDsNpV+pvGkrMwffJZTfc61jCmaMp4NbfTd4QIIb
	cO9Mkg8rhCNGXwF3AgvKIuJ+BpGezc4xAw==
X-Google-Smtp-Source: AA0mqf5AgHKASRPQ3vxp54Lm3TzQhz2KoodQc2ej7il7+nz9XZ7xp52JTHjVoe6aYgU+e86HPZbz4A==
X-Received: by 2002:a37:8203:0:b0:6fa:3b1b:9c80 with SMTP id e3-20020a378203000000b006fa3b1b9c80mr48181641qkd.722.1669684480454;
        Mon, 28 Nov 2022 17:14:40 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id w10-20020a05620a424a00b006cfc9846594sm9638299qko.93.2022.11.28.17.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 17:14:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: revert a meta-clang change which breaks pixman (thus, xserver)
Date: Mon, 28 Nov 2022 20:14:32 -0500
Message-Id: <166968447319.1339510.6881394005401630786.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128174213.194165-1-ross.burton@arm.com>
References: <20221128174213.194165-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Nov 2022 01:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4170

On Mon, 28 Nov 2022 17:42:13 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] CI: revert a meta-clang change which breaks pixman (thus, xserver)
      commit: 4f1e45b6bd9cf4ff8d38f33f587d257ec1b30d6e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

