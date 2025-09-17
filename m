Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CD3CAC59F
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:09:25 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.36395.1758146958248681822
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=dNrBbrDa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-78cce797cc2so1859596d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Sep 2025 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1758146957; x=1758751757; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8urgOWJR3S++AORW1dIjmSMRHHd++DYSJNC2y/xYKAE=;
        b=dNrBbrDawjx1hIh33T6xIIrVaMSDcOJ2v91/NH+5dty70ep0VK3b8/pUjMxNuu9YGT
         SsgzcoUwTuHKhUIB76bHp7bvypiJWBtJJrosSsKluHg2CSuccDz602GBiHd7S9IemqwQ
         EblTjhlVl/dD0v6FXOQKkwkhJVrAPD3ylillmfyur71QMT8zjk8iizANUIZ6oaiH7TvV
         nLFHBJmbz3sIs4w3mnuKMD2Yth6BhTPXJSyf9p8ORnb5tfIlyQ6NVqq9ByCqNCF3NtPS
         AC2bYnAsrdzJ3tB/0sAxl9hsYuO6OZ1nghAeO/kU9gSGmu49WyIrmx6AAjlSVAY5tXzL
         hnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146957; x=1758751757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8urgOWJR3S++AORW1dIjmSMRHHd++DYSJNC2y/xYKAE=;
        b=PpTZ05QMaEzqtQ/pyonyS1tmpHHzYx4MSJkXRO8TTdOUdG1KK2f9NIrqHPz9hHDE4X
         RpX/p670r3HaywfPSKEfSe4Kb+5saFAb2ydbsczeqoeI3s6/bBrP2HwFe/RASoE6WywM
         JzOIvcKCV+Bcst2IsmxqRow3xKn32iZqhnvpSjv7mixNKchS9HEZyeh3IIyFmCPzw+0r
         WwCMSFbNtL5FG2HvmbMnFir9o51XMBG0nrFqtO6EqUt0Mu1FGJprB89gIXjJ3EN09jnj
         pjEh8fv6dOc/HoMFxOvz6MV8wKerEkfC985dRpqSt93xm59dna3kcUHQqYy9fXXz6gc6
         KddA==
X-Gm-Message-State: AOJu0Ywf7ZyO90jrKmjCnh30SWuQB4lY2xz3DyNKaaFLxNQX8JNh9OPL
	qm03YKz/ng5vPaAsqRd8uOAHmY9YBQLuS53d0Kdg70Aah3p4zYCq/UcAB4yv240ufSOAm8awbeK
	+jyc=
X-Gm-Gg: ASbGncugFBtXnyHhcE7ybtR4DyE2kcLfgxrUOJUJ3Ddg3e4l76DXmKkohgIt8uWldJC
	fe7iFUQql/DDER5VV2SaZ/tq7fK4usIA+62I+knA54iunJRf5/pjV8IzChkx/4PLTL1k28awlJz
	x7474Ht4KrsfuYI0QlHx5h07FJBKFaLWbJ90cM+r14csgTOJ9VSyJ1kd5jAHBcxyQ1w1Lo17cOr
	A15bkSQfW2i1obj5u8DOLwCID7E9vAWfC2WhCL3loy71yWDKBx6iiOQNoPOOsHnGFu9txIPDAdX
	eko5ftQYSzbg8pk22A+H/5Z6kbhQi1rYGYOcH3y5TMnh8QSLx5jvuhex1esNgxTlbfxwzS3SCAO
	YBhEFeXfzC77FuYkWNsSE1DKjn+jsm3LH
X-Google-Smtp-Source: AGHT+IGZstH0lZK7f7Fl1CfxF002C7LTtoI30yaQzo2WdtYQL/ztAPKdFrrli2ezrj/ba2buMYHnlQ==
X-Received: by 2002:a0c:e010:0:b0:78e:e683:8372 with SMTP id 6a1803df08f44-78ee6838687mr33505886d6.41.1758146957011;
        Wed, 17 Sep 2025 15:09:17 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793474ac8dasm2690966d6.30.2025.09.17.15.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:09:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-base: add abstracts for easier ISA configuration
Date: Wed, 17 Sep 2025 18:09:03 -0400
Message-Id: <175814694291.1711824.6070892983994525555.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912135249.81126-1-jon.mason@arm.com>
References: <20250912135249.81126-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:09:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6716


On Fri, 12 Sep 2025 09:52:49 -0400, Jon Mason wrote:
> Add variables for setting the Major and Minor version of the ARM
> Instruction Set Architecture, and add those variables in the various
> places needed for the FVP Base virtual machine to run with those
> instructions.
> 
> 

Applied, thanks!

[1/1] arm-bsp/fvp-base: add abstracts for easier ISA configuration
      commit: fc986773f40613aa7e10ae18203fa5a064bc8b71

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

