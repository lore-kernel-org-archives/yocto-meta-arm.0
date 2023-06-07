Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263EDC7EE43
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:11:56 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.124.1686190306576071746
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 19:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=2LlCQbDc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-62614a1dd47so930506d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 19:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686190304; x=1688782304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tjwjL02KRsCYaa4M4wsRMhEoepxjv4W7s6kVZNowJQ=;
        b=2LlCQbDcwr30C0Hcrs1Ybyf0AXvQugZWoufLmAOZISHoznmg7A0seOEXbUJFMhV2L3
         UgiZ7XJw9Tc2ksxyOtdoRdz0d36KLt9CrVwpedQMM4/0zO99sPFtSHpn9TZzUEGQCWBW
         GLRjeo7vDvrCC/QC89ODUq4bUdTC1yxGF7LskWiL0ik5ntV2nU5YxPNdLvMa5c2MDaUH
         k0hM7LY4auEjTEPL0AjeVZUeOdP73lXzz0bPfVVnNTf2ZlgpVvsbIZtAxBIqVAvRTTJo
         VT1pMk0HLPAZqwuzQsGowk0ZKHorc7+4zumhjcDvaTkP9NoYjmTZyH0rm3CiZYB/IcGk
         elgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686190304; x=1688782304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tjwjL02KRsCYaa4M4wsRMhEoepxjv4W7s6kVZNowJQ=;
        b=gF2blxAoz3JZxDXN0SISO2kuShFqkC6tSJdonqIxB9xM34ARtaBvj8zb7NMPK6O29l
         ErywIwRVGHGhktqZ0FO1ASmcgZsAERCy2gJ4Vx0AiA5yoKxvLtx2M9KdxGeoUX1t8GoO
         f/pBLMS4aDXYWZOpO4O/5X1h84Ha+MdiD4ZmX8DiO+8FOCDpW0618mXZzKXApRFar7E7
         scyHRKEOhxURx61+Aspv1Nql6fdR9j2C23s5w6+K3ny1xVMk2ljDbADJljOx09HjftxQ
         xyvo2khcj8o52WcRoq0WRzCXX8nQfUWH6gWojTt4ZGZXbMLNDgNfhJvMliyJOOBAOtv7
         5SPg==
X-Gm-Message-State: AC+VfDzi0lxVhOFP2pkW52FzrNSzrGHW22h3g717ZsyoEgmehCRtg1wv
	juEljS/GlY4s+4hlQhhO1ExMzrqh/km0+EOD5/4=
X-Google-Smtp-Source: ACHHUZ6QY3+vHzAc4gbD6Yl6nzwvwNYGG7D/8b8rL89koug62a7ASmiYmoSsnIVQDkqmfO3vW91O4Q==
X-Received: by 2002:a05:6214:2466:b0:628:3e37:e160 with SMTP id im6-20020a056214246600b006283e37e160mr162764qvb.30.1686190304368;
        Wed, 07 Jun 2023 19:11:44 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w16-20020a0cdf90000000b00626204ad6fcsm60926qvl.103.2023.06.07.19.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:11:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: Re: [PATCH v2] arm-toolchain/gcc: Workaround for missing libcrypt
Date: Wed,  7 Jun 2023 15:33:13 -0400
Message-Id: <168616639801.3869142.18336002631784481496.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230606083143.1024516-1-claus.stovgaard@gmail.com>
References: <20230606083143.1024516-1-claus.stovgaard@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 02:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4745

On Tue, 6 Jun 2023 10:31:43 +0200, Claus Stovgaard wrote:
> gcc-arm-none-eabi and gcc-aarch64-none-elf both fails when packaged as
> RPM for sdk with
> 
> nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi-12.2.rel1-r0.x86_64_nativesdk
> 
> As we don't control the dependencies for prebuilt libraries we create a
> workaround by skipping the FILEDEPS

Applied, thanks!

[1/1] arm-toolchain/gcc: Workaround for missing libcrypt
      commit: 3fcafa3a945aa57d58ca4f1a0f6d20280df7cdbd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

