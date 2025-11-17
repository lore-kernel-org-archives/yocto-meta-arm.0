Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9533ECEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:18:54 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13293.1763396328436752015
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 08:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=s56UJ1EJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed6882991aso40211771cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1763396327; x=1764001127; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CBnOhEew6IqG7zJpQUha6NzM0SIHJGsgBJRL/DsrFY=;
        b=s56UJ1EJMGOJfdF4JtCjAtTz2LP6EZ1B1/TVhaL1TrwzNG4O8Kc2JR0F/BVWrfApi9
         JW1lamMHe9erhJAPkc0qYBVf8oUVZDQeGgiz3ZWsGaC7MaUiPBr2T5V2txsXYkaXBAjf
         o8HrICuwGi4mRGjQ24o6u6sZXrjqlYeXC1WVGcTkIeY/1hqVUkKWVN99d0HVu4Jvaj6A
         xkk5Mv6rHsDHHqI8ynkw4U8a2tbjzEp0rcEmOuPP3d/PLh5vCwO1uXt71FgBmZRVmLu4
         HNnQxDBKZNAwqQU2OwoOlh/hXOfByQ18GqvLpaeMgwo9Z0mrQfQcIzclNfipfQyo12ot
         bRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396327; x=1764001127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4CBnOhEew6IqG7zJpQUha6NzM0SIHJGsgBJRL/DsrFY=;
        b=cpfTlsTQ2G2oGSjHx7SdprVypymixVvO5MEJDvetIRhlWz0Ziv+3r2mAQ7c6iA9Zcc
         K/B3aslwkeBKd4yiwq5ldtHcttN3nCEbPDBzwXcgNnveszwjmPTGeL3kgZBgYwWFBSu6
         fOjLdgdD0EHQZRY0SJsC4SY7uYAADPMo5sjXAxM0PyA+Nzsis9bCLt9a1MUgFVJ7d0Rc
         OGrdnVN3MF6gfFdx6DTgjTuQZHlNBv4Z/bomJGdJFwRXTqlmtzD0oQXfMQliAk5gXoX7
         /tsBJ24R8VBOxY0wd5RycF6XHQicVhAjplVYEzuzXRrmmftRiIHvpT388HgkPo9kZV1P
         g5bA==
X-Gm-Message-State: AOJu0YxdpHouEnHYh200e8Alz7vbC5x1wsEmQkTCW1lZ+1Oi9pu30KC5
	v0E8KYgWb/qGjINoQo3soNJ/XF8HarwkZvn2ImKfPS2D9W00r4qGQthQA1FF3lOJQftgfRF+AVP
	hOLA=
X-Gm-Gg: ASbGncs0qxmqpNVvLhn6z1Ww2M1nXXpb6yYmsH5g2cqqPrQjyj5R9CSIOwSaH67cAgx
	zAUwdlBXXwagqC2eLw2gc5sXNnW7FfG27rAx4OPi4K5mc3z6+3EmW2+akV3YZAWtec8XS/IKbgb
	CrgOQh8waNVcAJ8U+rwOEN0drg7gM8Cc3pZ4bV3WpQ+L0ZscP6Am9gGzDVx2+WP8PHWKiiLHBI1
	5zM2I/EVP5Bvx2Uv6ewUo6aYHusJ5pnPyfHthZQ8sBLEPExhL3vbP6H0b6G4yHWYpykESlS8NZN
	3eZBlJhWlYQ7pZzk1lZCi3hZTDrACwzPNXMzVMyBO91H/NH8M/Ks24vQ5elkn7p11Ayqu7iso9c
	+6/XWdnbUEXI2cAGEoGjCQzxumCsKKhxVpLnKX5lR8qsJmMfdxYRGh6nk6Kw1HZzgzJM=
X-Google-Smtp-Source: AGHT+IGWCEMBMNTAg0/U9quFeqQxGY5jYXOhB5ySt+ZZq/pFB6pfOtTz2L7iRqv/vxHzeE0S+e52yQ==
X-Received: by 2002:a05:622a:3d2:b0:4ee:26e9:98ac with SMTP id d75a77b69052e-4ee26e99c65mr29539951cf.16.1763396326984;
        Mon, 17 Nov 2025 08:18:46 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede881ac9esm86289981cf.27.2025.11.17.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:18:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] arm/hafnium: split configure/compile and call ninja directly
Date: Mon, 17 Nov 2025 11:18:35 -0500
Message-Id: <176339631637.3301228.13330602586184923703.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113140138.3224976-1-ross.burton@arm.com>
References: <20251113140138.3224976-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Nov 2025 16:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6771


On Thu, 13 Nov 2025 14:01:36 +0000, Ross Burton wrote:
> Split configure/compile and invoke ninja directly so that we can
> control parallelisation.
> 
> 

Applied, thanks!

[1/3] arm/hafnium: split configure/compile and call ninja directly
      commit: a48f0afe7f96168cefacfd56db9e29384f57ced9
[2/3] arm/hafnium: ensure prebuilt binaries can't be used
      commit: 62b9a84c4d602a49fab4e08c753cd2ae70bf4999
[3/3] arm/hafnium: build just the root target, not the tests
      commit: 0cbed483f23590363b5ebcd7b9693a0d14fa9b64

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

