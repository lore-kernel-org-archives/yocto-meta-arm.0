Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECD2C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 20:03:16 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.1313.1720728189063022545
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jul 2024 13:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=a+EeMiMS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65651296d91so12058727b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jul 2024 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720728188; x=1721332988; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRmeDYmleRLZAPRPPNAD4aDmnY2Yb7bRk3flBywNGyE=;
        b=a+EeMiMSXNa2ob1mkyPPlZ8Td5Rf88uU2dowU7Jkzfa437dkkMVDqY69+5yq5GOuRd
         YbAuFjBAulrkyIKX5BrAbHq0XYlFTm00Jp6vnIaBdgfWpB0a0FW/n/4cAmRi+jgvPuC8
         94DZUJr1h3fUZY2nHR3eCe9dSY80OPVCRar/OVZHfCb04aeRRyFjqVgwKRpIPiYztaZQ
         l3rTiVIEtBQFWu596qpLnZg+IPnPkKTyNHHZK6KlDwSYWPozAE83vzRiJUiyDRFaOSDO
         coNRz4Ta0VuHXjidP7YYH9ux19RcEal4RoZ0GG5XMbjYdUvVwvLH0LYzgJOWr1NOwkPN
         XHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720728188; x=1721332988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRmeDYmleRLZAPRPPNAD4aDmnY2Yb7bRk3flBywNGyE=;
        b=hAl3Y6p9vozFAjf/XR4Tbaea4bNfO/L3fqqSSU+sHbzmXQLCXJjx5Q2Q0xXLnMw15m
         dQaGLpH2Gb0ON4FtY165iDUTPPtQOgh3m/ZN7rkO8cQfqdK7Q/KwDGsDIM53fJHcua5M
         1ZynYGgyt3BqJzhNuAbNYsP08XBqpg5YVqtKqgFbVSLC7bWJC1XNoYYLSUz8nbtgUy0q
         A1YNnMTbEMyhqVrVTUrkgeU0E7MoGmWJu6GZGfSHrvCvF7mOkN+9O4HZgaz/GyHRUGG5
         G8x26l2rLh+I3x/YICpkGgTCH1qCfDZ2ZoC4HE3rGdHS1TUTWWDehy+AauoRfySNK9I/
         ra7Q==
X-Gm-Message-State: AOJu0Yy5AroQVoe0Nq+QbG00cu7rOYp0fwJz79NujvCV2U7pwARi5LZb
	eOQB/98araVkqy2ghAiCyhrZH7ofp2GL6fhVhj597/roWtDABdqm8E/SDxoBpdELFGOozlUBigw
	=
X-Google-Smtp-Source: AGHT+IFLV1K7OV+vCTJLuOMocCqD4uxm6LGHNlqhcrktRWVIVWdPap+OdVCVw5vs3p16/n2aPQXUFA==
X-Received: by 2002:a81:8d10:0:b0:64b:44b4:e13 with SMTP id 00721157ae682-658ef34141fmr108291697b3.28.1720728187690;
        Thu, 11 Jul 2024 13:03:07 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e483ed19sm12175947b3.21.2024.07.11.13.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 13:03:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	amr.mohamed@arm.com
Subject: Re: [PATCH] arm-systemready/README.md: add ARM_FVP_EULA_ACCEPT
Date: Thu, 11 Jul 2024 16:02:50 -0400
Message-Id: <172072817151.2708276.7579776439165996438.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240710120927.2204506-1-amr.mohamed@arm.com>
References: <20240710120927.2204506-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Jul 2024 20:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5882


On Wed, 10 Jul 2024 13:09:27 +0100, amr.mohamed@arm.com wrote:
> Update README.md file to add "ARM_FVP_EULA_ACCEPT=1"
> with kas build commands.
> 
> 

Applied, thanks!

[1/1] arm-systemready/README.md: add ARM_FVP_EULA_ACCEPT
      commit: b2f6758fde316838d35eac3db437e2145afda772

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

