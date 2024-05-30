Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F16C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:41:36 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.7328.1717072891444246835
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 May 2024 05:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ADMNam2i;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7930531494aso52337385a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717072890; x=1717677690; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzsiY6NdeZAcN3mYF1ANloeA+Vs3YcazG41Bmg8JMcY=;
        b=ADMNam2iC4Z3YrV6Rtfduk2TFy4xdpINNWhGA883tzsoPMbGix9ApPEl9eS9UHvmqr
         Kq2qxZR9gw6hyMBiZTxtuOAc2K0mB1WiqIxj1XIWBltle42fOEV5FrWYoFXMrcjU3juW
         YJSG03k4JqUx000gDwO5U4BNqvESJV6xbOewSUFcf7QUeOi3B4hU4qKCP575v5Ykx7rJ
         dy1Tn5UdGY6NARCvMA93eB8QOlfqGUnalqRYO0HHYD29EppKvsSLsC8nPj6VeO4hsI3y
         qjZ834SOZ/GBEJhiqgx1fjMtbxtqrAO8DKSQMifWLtpZU13f38SMIJ7sVNfRj9EdxwMA
         SqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717072890; x=1717677690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzsiY6NdeZAcN3mYF1ANloeA+Vs3YcazG41Bmg8JMcY=;
        b=TP55d+MIXkn63fGRuDgE+4hQPpGaqoJMGupSDRI+6AnBC44DyNIH+QTDrihOX3r5cb
         zC3G/6TvsHB2zGTtsGz04G4kqwtIQ4RpUXeK6Et30HyyN55BDgE9EqDgrweGupBNwoIg
         LM0tZ5WCcdsQqonITR59bPofLW8mke3Yg71EPp5BgoaXLzSFuEOjA76mdKkBf7KS9+pb
         gbyW2Yc5ugPKDuExmoELAs8s9n3zrYU8vnNo8R16ai2e3bXdXKiOY84m7UVKYGWUyd/u
         0Y+4VbpERzwKFmEIUxQ/2s2IDkYKHIi0pRc6d2sLBD6gdv7omLvS5BhTTu74K4xdMAbj
         2sRQ==
X-Gm-Message-State: AOJu0YwKf6d6PTZYCCVDojlvRBxZ2MadeA3JZpmokEyf9LCBpbA0j+QL
	MTTJRQwKQODiXDZBmsFqVHbx0oTVrLeXZbZs9l6GpuMd0S8hpQPXEjkjI02hoiKC7W370D+2wUo
	=
X-Google-Smtp-Source: AGHT+IH9OgFVhAuPqtcdsumTl85JT0/YjBHSio4+x9DQ++g8w03cCMfAZ06lZrNR5GyUcpOpFsfqjQ==
X-Received: by 2002:a05:620a:5e45:b0:794:af85:34 with SMTP id af79cd13be357-794e9d8d908mr197020185a.3.1717072890206;
        Thu, 30 May 2024 05:41:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd08ba3sm551991185a.95.2024.05.30.05.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 05:41:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: Delane Brandy <delane.brandy@arm.com>,
	Bence Balogh <bence.balogh@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH scarthgap] arm-bsp/corstone1000: update the documentation
Date: Thu, 30 May 2024 08:41:23 -0400
Message-Id: <171707288467.1718187.6768232041735924958.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240529162420.41184-2-abdellatif.elkhlifi@arm.com>
References: <20240529162420.41184-1-abdellatif.elkhlifi@arm.com> <20240529162420.41184-2-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 12:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5775


On Wed, 29 May 2024 17:24:20 +0100, abdellatif.elkhlifi@arm.com wrote:
> Update the Corstone-1000 Documentation for the
> 2024.06 release.
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone1000: update the documentation
      commit: e0f39a0a8b4725ff9c5803345734dc143456ca3a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

