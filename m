Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B786C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 12:57:48 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.7060.1749646659314441296
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 05:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nA38dWoL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7cadd46eb07so680549585a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749646658; x=1750251458; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hi5ZxAGIZzhmrVcWb+zOEqAOYBw8UAleQpEr49IsHSc=;
        b=nA38dWoLV5oQRwgHw971ujyY7fl6ZR3HkvC4jGr51MsFALM40t/OJHp+04nCkP49Pc
         LEZZCFIxQTuBqHSEbPuPtsY5rnRIrrTKcrQ220mQ+3cqWpU/SUiCSccZ52W9ZKxhCOPf
         MCVQb2n943398ypfZotx5tbi9+Z8h0PGv58cwAwtOj//xe9yeP2aOtjOLo8d7KLjRO64
         zOmIZaqRcb+AaLext7pGvDnNNnGu8i94g++FjSA3uPdMG82L/O4XZFe4wJ4wwUpoFkkE
         5BRFWU3nXGYBKLYVR2H5opaFEjQe7YfwjTyUZxMFPXGqmVSHF4fdjlA/LM6s/MnfDY+V
         +w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646658; x=1750251458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hi5ZxAGIZzhmrVcWb+zOEqAOYBw8UAleQpEr49IsHSc=;
        b=Fetw0cP3fNSuoH5HQzQrGSYsUPk/MVYgSIOBSYP5IUq/RJjDPdO9eH8iBs64TMeyCY
         6V9yDfILhjIqei5xpo7U61epY0R7rdYW6E3Q7cQEJWTNFz2skhoyGIyXLDR3rCzvM1Jb
         ieKmzoQbmP+vCnrobmrYL5FnjisW1jZuTv/iY7aexHPL60j3r5JOKyNPWBXRSgSp2rDH
         +PJ6Dxw8+3C6rr6UD37QLH0nc+uFx4N2ke3YqdhZ59qV4FevTlIrHhTfsADyrvAMFrKO
         L3G74cwlMe2hBGCx1QkP/LrGhcXXejRoyy0iwtGDYJnK2xWW+Ubt2B6V/XRyDaM1D5B+
         QHTg==
X-Gm-Message-State: AOJu0Yx3fhncQV5TM88lMv5folKf9aTUOSk6N6EE7bPLm1lqg9SpjdrH
	ulp+ri457ZrmnSH/aizpcNz59UYO6fhqssBzZJNU2yIqBJC/rEXz6nC1TXq38HTWdkVvE7PEZ59
	yBBQi7g==
X-Gm-Gg: ASbGncsqp6UxYDdbT7T4kxctf32i6aLbA5IqqOwmv8uzWqlzqBmOdoRoVn0bRQxxqt1
	jcfIsTXXLMAMNXKPl3pgZhI2UkWtDJZJvNLPsgU6L8E/tXOp5Ka+xX3RlY7H+Y1ghuakUPEBcyr
	UXzYuGpc7kyL8fFPl8UXMfUl0yeYnYv2ywUh8rmQ4btO2pRPC7q7cXD4c5PZ2lMNkCPpPaObUC4
	PyQpdNXULSe0xG8Pe0Lu3YkaJvoGuHmCp2tP2mpLWpB2hmsLMAr9xA+djwleSmmZ9FuksT0dE2M
	7yExun0brJJceZy8Y1Ua8zf5GYCttuPSziCEeJI3P/5nOtGNn4HZaw==
X-Google-Smtp-Source: AGHT+IHVJ0VkhskJoiDnkhQtPUhPBF45lPVBEA6LGPvfa1HIP4qDVVGue5RfNk6kl0aepbv+DbIKgg==
X-Received: by 2002:a05:620a:1a28:b0:7d3:9203:2070 with SMTP id af79cd13be357-7d3a881a875mr445466485a.15.1749646658136;
        Wed, 11 Jun 2025 05:57:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a5369a7sm854455785a.29.2025.06.11.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:57:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: update sstate-mirror.yml
Date: Wed, 11 Jun 2025 08:57:24 -0400
Message-Id: <174964664434.2418415.8618550369085110186.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609142048.85350-1-jon.mason@arm.com>
References: <20250609142048.85350-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 12:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6543


On Mon, 09 Jun 2025 10:20:48 -0400, Jon Mason wrote:
> The Yocto project changed the server name for sstate, though the
> previous one does still appear to work.  Update here to the one matching
> the YP documentation.
> 
> 

Applied, thanks!

[1/1] CI: update sstate-mirror.yml
      commit: 31549c12d2ee6f655b45718bab2d5c298eb99a0f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

