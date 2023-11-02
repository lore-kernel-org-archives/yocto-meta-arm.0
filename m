Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F16AC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:17:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.37275.1698945437678237656
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 10:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=S4ZXLp2/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7789cc5c8ccso100689385a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Nov 2023 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698945436; x=1699550236; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3RMu1oSsewbwIDM8hoJCGMKXNTVCDDbyyTl5ipJbC0=;
        b=S4ZXLp2/ns1BHVQIcP5cva7/45QRlxVTjv90bC6Waazd5RB4HrtOMZi0LorqtyklYe
         LvY9cKYFRvAhB4s3xoEEAQLOMdLm23v5AMUqoFfFsED0nDXB7bJC5Fq0ap447JhO7BXY
         uwY5NXPAwaC9MP8qJugUvd27XlMigzSDkkd4ex2D/eRLHP2Z5E104OrRzWNREC5CmMMb
         sGLCjVdtIRT1+IMyUcGmKjEofk3MbtsfPXx7srDWsWJgP0xLti7DdgTHB0caFf6wzjP8
         533TM7yo7N1aTcy3CEr1lAdI7WKpKxe3CQv7zrngtS3pIj82WGpKDTt0+4hK9Z0llp7y
         /M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945436; x=1699550236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3RMu1oSsewbwIDM8hoJCGMKXNTVCDDbyyTl5ipJbC0=;
        b=t0PQfbNRIxz+vZUeIpVzSPQ2lMHbyfZSIs1LCaT5UtL4mo1iAbbh4CMD6/i4w354+k
         rhOOqYD4hh8a5WrHb9GUytgTnhijqyOTG8HIWRxYel6H4bgrYYQy8Jf7OGDDc6Rrnhcw
         92q75+HV+iG8Mse+vm//fesmqLb5be3nRdp6X12Is0is3gqQel3fxhxUyNfyXz/KBaIr
         gd7XSOPlavPxWcy6C19guTyh//1aWuUCfWzem7yWDrT3T/oElvO1Ff0JiqManTGjIeJZ
         TwNcsDxSkHCdxNZM58PUjj2ybFPPkgh2YNlPpJ+Fd5AKGYMOVyiDRUG6JxyiAhycwXIb
         L1xw==
X-Gm-Message-State: AOJu0YxmINMjSce7U7KMywo+sTBRXgtSRiT1gLHyb/aHvCcB79HC7l+x
	QApkl+vbaNjrL6/2BueBROQmhGbby1J61Qpmm/U=
X-Google-Smtp-Source: AGHT+IEB+AJse34EwdphZwXOjGKcYw/MgSK+dzGTSmZShUN2eClRfFtYYjQ2AgP4VYNvQ5u/NMbf0A==
X-Received: by 2002:a05:620a:284a:b0:775:c335:1f2a with SMTP id h10-20020a05620a284a00b00775c3351f2amr584346qkp.38.1698945436214;
        Thu, 02 Nov 2023 10:17:16 -0700 (PDT)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id s15-20020ae9f70f000000b0076ee973b9a7sm115960qkg.27.2023.11.02.10.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:17:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	ali.oezaslan@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] corstone1000: Update the user guide
Date: Thu,  2 Nov 2023 13:16:26 -0400
Message-Id: <169894539035.3995537.11842049903704809610.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231101152732.1060-1-ali.oezaslan@arm.com>
References: <20231101152732.1060-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Nov 2023 17:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5196


On Wed, 01 Nov 2023 15:27:31 +0000, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> Update capsule document procedure and ACS image in user guide.
> 
> Ali Can Ozaslan (1):
>   arm-bsp/documentation: corstone1000: Update the user guide
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Update the user guide
      commit: 559b8af1edaaaaaae81e3db0d913bbf47a2b60f5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

