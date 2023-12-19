Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E710C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 20:14:12 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.5946.1703016845218249373
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 12:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=z7AN6Sgf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-67aa0f5855cso22852456d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 Dec 2023 12:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1703016843; x=1703621643; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnp/XpuqfP8b4kAIJLneY7e+li21vAv1tk6xLJmgD/8=;
        b=z7AN6SgfJkvs1di1dNsUypmZVQd+jZ4ioEzlQOxAivm7wfXZa+i3A6Zljnp1iMjway
         QeVjLUJMIYYXzRizhLzgRtwm2IyIRwM2OlUJg0yT89qQG7dud6gLeIuBnSum3WNNsdvS
         i4hP7fPUasYI7bBB24Ad8eIuVgJDg20YBYXOM0R4MM+LdxZDRYDQ5gG/hZSke6Re3Nbv
         zr3B3G4x4bXOBnbndPJmUL0MQ66lPUbvJ34/TYoxyUCd45g7jp2QkIeeugWwWBTuPnsl
         G+LDLl3PwS/e7OM92EoT3qMG/gYC0Anjp7T3dOSBth3zOEdjE6oy2f2QqZ+UFeLDGBF8
         NjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703016843; x=1703621643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnp/XpuqfP8b4kAIJLneY7e+li21vAv1tk6xLJmgD/8=;
        b=U1H3cIE/eZSsSNsYuxgzJfwg9g9GrEa6CO7wimggwneAPVjNcSmXWMoGONltpN2sLH
         SwhGMoObIytzn4SLSy4vf5lj3hGmzNhk5bVX+VdLQ2aCVA+SclQYhVhHW2yiIPxsMvff
         glOqdw7DlLATkICnw5MKECr05+/tlCOxGG9WEAb2/Be5uFTs/RNWfal/f8utLFfwaq6K
         I8CL5QisQOiB/bRvm+IGX3FJHQUYyYDbsaQHaUHU9lbUQhaUCR2DQV3VBLI0vTIkgVIA
         /ca1EgEiquSsmobsGaYFe0S7/7JsS1v3KJigNaCPm3g+TeyYOt74D71Q6KWw3HoyBma7
         Im6Q==
X-Gm-Message-State: AOJu0YzClIhZxiHswB0lSzSTfTm+80inmFXcj8S5OyL8KAZmyu0AQOLU
	ONLFiQn6NanGZnDJPEj6hleMWsbAxj5wjE4ruYI=
X-Google-Smtp-Source: AGHT+IEp5NmqeXqkV8GMcWaNy6HLn+ULBeNPyb6+Qfw4TExDD36uBirtEBgnsxkpJyswADONMZIA2A==
X-Received: by 2002:a05:6214:258a:b0:67f:30b9:13b7 with SMTP id fq10-20020a056214258a00b0067f30b913b7mr5174010qvb.21.1703016843140;
        Tue, 19 Dec 2023 12:14:03 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dt48-20020a05620a47b000b0077f401aab62sm9356320qkb.125.2023.12.19.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 12:14:02 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	harsimransingh.tungal@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/tftf:corstone1000: Fix tftf tests on mps3
Date: Tue, 19 Dec 2023 15:13:46 -0500
Message-Id: <170301682642.2241935.15253683717052250667.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231213115041.1417809-1-harsimransingh.tungal@arm.com>
References: <20231213115041.1417809-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Dec 2023 20:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5307


On Wed, 13 Dec 2023 11:50:40 +0000, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> The tftf tests were getting crashed on the MPS3 and two issues were found
> during investigation. This change set provide fix for those issues:
> 
> 
> The tftf tests were getting crashed on the MPS3 when compiled with
> LOG_LEVEL=50. So, reducing the log level and aligning it with the TF-A
> allows us to get rid of the crash.
> 
> [...]

Applied, thanks!

[1/1] corstone1000:arm-bsp/tftf: Fix tftf tests on mps3
      commit: 4d22f982bce8dff6f8c4d11845c47a4d39f961c6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

