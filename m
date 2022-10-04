Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC152C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:30:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.15106.1664911802049787625
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=jw8shymY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id s9so8997082qkg.4
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=5UMgE/xPgcSzrP8sJQoDT6vNlduWXaTahftk0elkYF4=;
        b=jw8shymYP7E38RqSYnRNIlrp256iAZcPTqhO6Qx+D1FDYXKiBuGeDDnlqmHkJC8Qlp
         NkRlQ/HBJ7GPrtZaqTChdcF8ywqWZV9MRECwwq4WV3+7+vjLmBua0QT2ZlY44jYwiP7g
         GOCB4HqPw1ykatQUr++FZ1LvJcHtkgfXi7EDs594PVzCt/s0Ut1gu2kai55Qc3y9ZEwU
         9lR5MucfPJ+sA6OTfrii7b1eYxwTtZwsG713nJqZBSxvX4gpY9FeyXr85/FkAL15DgfN
         92fHJulXF+uXQ0YiNG44TOv6nU7D1h1g3hAXsp3dhkP6yrH/AiMRgvl6LjkeQDJvI8hN
         pb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5UMgE/xPgcSzrP8sJQoDT6vNlduWXaTahftk0elkYF4=;
        b=Rj3VSH0ahULllo7RpPdyEyT1Y3fwZs5r1cZ6JEGupKj9C0oSFBOGK1lkGaD8LRHoFq
         O+VHTA/zzDsmFU/PaUt0mCXGm9ChppYvYEaALnGhO+nBaQrSTnudIFLYreGX73HZ2nME
         7UJjr/fxKNasiZngyV03COrKqUZBrr4cUmRVlubJcFPSvT5osA0cGqrpqO8SP5R44g0d
         o+OQXSqraDuS4+GPeErC19RA+O5BRoY0CTk7PO+bxdY4GemB2Dz7UXqbk3oHWEZPOAUI
         kBhVZXGwv+SdXYyavciEumRe02f9NeffzPV4vUGjVBAaKxaquhzpWfGBu5TaKV06lHrR
         Ni/Q==
X-Gm-Message-State: ACrzQf2x7fLQtURZo/2yThFAQqH57wmhkiuXY0/8qyb0AfpyNr6Mhamy
	oNwVzA3/iV0o4lIZH7cMBSgtcW4Bgu9X2g==
X-Google-Smtp-Source: 
 AMsMyM7LPVSvUSXPbfb58vKm1B9HGccTI9DKQ9AlGG9IEarRrBk8eVVcgnJN2LWgLZurlr8mOlfB9w==
X-Received: by 2002:a37:a92:0:b0:6df:ca3f:2a82 with SMTP id
 140-20020a370a92000000b006dfca3f2a82mr2731656qkk.7.1664911800531;
        Tue, 04 Oct 2022 12:30:00 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a05620a248d00b006cbe3be300esm15257547qkn.12.2022.10.04.12.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:29:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] meta-arm/trusted-services: Use GCC toolchain for specific
 TS recipes only.
Date: Tue,  4 Oct 2022 15:29:52 -0400
Message-Id: <166491179508.2384963.11685277639408487961.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004155646.2527610-1-Anton.Antonov@arm.com>
References: <20221004155646.2527610-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3922

On Tue, 4 Oct 2022 16:56:46 +0100, Anton Antonov wrote:
> This commit also enables clang CI pipelines for TS.

Applied, thanks!

[1/1] meta-arm/trusted-services: Use GCC toolchain for specific TS recipes only.
      commit: 00bd768ab702ca9c137fb0a9e229f53d8a85ecd1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

