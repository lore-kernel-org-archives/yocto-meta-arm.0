Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CD3D41D4A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:32:33 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10491.1765463543661927902
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 06:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RF5cmGhG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2d56eaaceso15866785a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Dec 2025 06:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1765463542; x=1766068342; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+n7lp7fHbb3ACbjYBGJQfLPBeVD9FknXPktkITcM54o=;
        b=RF5cmGhGDXUphYpjb90OqXvgdlecElqggZWx4qrlmPbrgHI0QsQiCDXKXnlm8/AGJ0
         1BdG26uGTpqwyLzRGb8qHbtipGEXI+tnPV7VHF823/3guW7HbgtzbyAe6iWmGmHQ2aLt
         WTLc0XnnaXRr8N0/F0l2f6vVBWoqwKPjmbfeBgX1bcc8nI6IJJHbicRD9c4hyOd/HES0
         XUpGwYxkRBEoVMCuB0S2A+2waC1+iICkQ6M7CW5hSayuKzSNWUx83a1rc4/KgoVxNiWd
         j65e/1xCjeBzZoS5H/g2LtSOpT4yZhSeKcmp/1H2wOIg4ob5Lm+5bzF6qFnyJJp2xMQV
         XCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765463542; x=1766068342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+n7lp7fHbb3ACbjYBGJQfLPBeVD9FknXPktkITcM54o=;
        b=fEpSNHSIeUo3c5uXftAowd0tFMJFBHatHS8AweuYcz/pdY683Cd2gZvV2gNMrwf3pU
         dNWF+WnYKdjdulBveKNsD9i/jIyEAu/VwTY6HN8HCvYqxWQbR5KxgHKKxte3Ek0ufvG/
         yodxuwEhtyTJWsa5386wESpaQeonKlDbGT7vk3d4Ek8g4C/eCAd23LBeL6FzGSap/9kt
         kgdQ4g06ELNkP5sxbR9xHUuB9TcaioVSE5ZAplliUZLnWLeTjvSQHduuAe201Pr4s6RM
         Z5QEK+sTd2m8ZF4GCSp8EodcyYHFdzIlN+osNPL6i2Su1LI9OBeWDyHl9wpebYbmzVck
         fkTQ==
X-Gm-Message-State: AOJu0YyGuiD7SR9Gue+Z9hKdMFAZEDYhcLOeq65dToV9dhNehhh+rZQJ
	j16/hHN2zhH9YPlDq9ZEAPlcu9OOJCnHIuoo5o/LJj302OT17NVQ7KBg47W4uSc4V/EJjTewGnL
	DASIvtQ==
X-Gm-Gg: AY/fxX4b9d8bLKEiiTwVx6fiEIO2fcun1ZffS2iQtcsPNjls42g/xmTfKX6JlCOnt9a
	HxtnUYyF0XDS0WaHWAsIkA5yeybty3YAUhCibKus4/cQCeiq3seyGCoR7JXieQr6KCTKwDmZKKV
	6HF+dPl217psG4xNDTS3Ogutx2stqHZvc7RC1R6QjQU2pwamgriz9RTPnIrLapLJcQYGKPPxexj
	C+ItE4iC/miIJVzjIpin0FBtKmEIggaskDD0rAHOp55dgiNJGAe05HJobnErT2YBmmesHzSot4L
	8vadv197wemP7kGUGJpXelhdlhcReKCyyomoxTKsXvGEtzWAVymLOoEtAWefsJdRuDB5+FulXTx
	GOYaA3gQk4bF76M58QEMDuFGL6FmuDmQeMkrhAjWvQo8GgxOFNcsBVAnRFfBCP2akAnYGvokvcg
	iKag==
X-Google-Smtp-Source: AGHT+IGGRFxw+uBSllltu/QC2LsGId9F1lBvTqXWHlklO7dROCqCOUvjAv5Tbws8A0uo3tayqzhjNw==
X-Received: by 2002:a05:620a:7108:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8ba39d46963mr867776485a.41.1765463542058;
        Thu, 11 Dec 2025 06:32:22 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5787d54sm233643285a.23.2025.12.11.06.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:32:21 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/u-boot: update fvp-base patches
Date: Thu, 11 Dec 2025 09:32:14 -0500
Message-Id: <176546353444.2075883.3325429185126213319.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251210163332.66571-1-jon.mason@arm.com>
References: <20251210163332.66571-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Dec 2025 14:32:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6795


On Wed, 10 Dec 2025 11:33:30 -0500, Jon Mason wrote:
> u-boot has accepted some of the fvp-base patches.  Take the upstream
> versions and rebase the third patch to apply.
> 
> 

Applied, thanks!

[1/3] arm-bsp/u-boot: update fvp-base patches
      commit: 5f8dd8c3e775acb5d95fac0947c61c8f80f5eee2
[2/3] arm/trusted-firmware-a: update git recipe to v2.14-rc1
      commit: 4a1969f3e52aefeb398adb92bc78fe8666ffadf0
[3/3] arm-bsp: add git recipe versions
      commit: 1baab2304144c97596498866e250377c0b792693

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

