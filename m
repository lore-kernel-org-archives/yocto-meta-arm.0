Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B903C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:39:48 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.14003.1677083980958533091
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 08:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=spy4RSTe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id l12so8051956qtr.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDOz5Doa+6nbAiF4FESAq0ED28l5FQNzDvS0YshYbMQ=;
        b=spy4RSTeQgfQxVlUEbC2dG03JBQR7LoRvFffSVHSYjLfmAxJ8Bxvr9QjC735Dl7VvE
         pBraJfCkUbvswXmXICVBGpJrJNRjpsXdkp5/xu5AV+23suDz6D+MLza8wy+Fg14RMAZf
         iRbJaaI+ffkuDwJ2zBBK92xe2rMlsPdKOgr3lOXitL0qMwEN1kSguObDP4ce7OzGG4Hh
         gYlXwNa1YPZPg+ihHS4qzpr1FCN9WLODer+Mt9enKqY/dyTq5uNady03m/5in3G35Spc
         GbuZ89tzCiW6NuHO0GA6Ux9Va+LOBh4vVa7j4dUZrRrRJ9R8p3AwPO0i+omQfg/wzubE
         w6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDOz5Doa+6nbAiF4FESAq0ED28l5FQNzDvS0YshYbMQ=;
        b=K1kpmln6T0qEALox8QyAJGjcOG8dJMK8JXSiW1E7M1v0hw53kJjxOmzw0ZtnLPRmrX
         0TQGuFHCIz+BhtQijr/ZLFMxdjRYstTNdePZcVPtvrIBi5A1r0ZVP5zK7gWuPx7LEm7b
         IyZe1RGmF/NjP4kSw4NBxOWkqjwMT6TWmMX1+mf2OFAA+ECX1ReUFxP6Hu2vvlkMRxpd
         uQJKS8CwHfOfPO80TP3q7qP5hrcYB4XfFXLYCcwejCg8iSmdK2FThxZ5iK1RFnKWeAym
         Q1dcWXhEgF9/kjy6uDjjJgMHwx0Jeaz5Nr21zZgJeQ3P5ugPJAxdfCpOHYneGwGyH4MH
         +AKA==
X-Gm-Message-State: AO0yUKWpD14nlYVbWS7NztKbfYbO/wmkMQ1uDy1U2zorHKTEY5hrmFJx
	svuPoWxExRQVlV5mVc71ldinkwHaemg8Lx7e
X-Google-Smtp-Source: AK7set8npwIkqBAC5TO5Qohoxsid5ItUrNe0oxozlpbRvsP1TKm8IovPxyljuAAKx9qjV5DNMIXuHQ==
X-Received: by 2002:ac8:5b89:0:b0:3b9:b42a:7fb5 with SMTP id a9-20020ac85b89000000b003b9b42a7fb5mr14038259qta.56.1677083979584;
        Wed, 22 Feb 2023 08:39:39 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id s204-20020a3745d5000000b0071b368cf074sm4040192qka.118.2023.02.22.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:39:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Fixing psa-api-tests by increasing number of assets
Date: Wed, 22 Feb 2023 11:37:30 -0500
Message-Id: <167708385325.3620198.2442880737349153732.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
References: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 16:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4443

On Tue, 21 Feb 2023 17:51:27 +0000, mohamed.omarasaker@arm.com wrote:
> As Corstone1000 stores at boot time few efi variables.
> Therefore, number of assets is increased to compansate this early usage.
> 
> In order to comply with isolation level 2, SPM backend should be set to IPC.
> TF-M provides IPC as a SPM backend which gives SPM and each Secure Partition
> it's own execution context. And provides higher isolation levels.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-m:corstone1000: Increase number of assets
      commit: b3ac88b4e83f542099a8731535e382888e0aa1b4
[2/2] arm-bsp/trusted-firmware-m:corstone1000: Set SPM backend to IPC
      commit: 19452d568f1ee148da193c202c08101774e29776

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

