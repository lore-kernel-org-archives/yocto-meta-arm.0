Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9D2C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:13:43 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.35026.1744398822556190782
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=jzLijyKb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476964b2c1dso38624581cf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1744398821; x=1745003621; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W26FMtJNos2pFcdSRNrv49yeKOkyUMg/CR0EjdG43o8=;
        b=jzLijyKbfzRMHXI/cYgAMvQ2WFLSJssXL6p7wX8PA5sNDgGL5A2yzPwyq369rBE5e/
         YCKp9m+r4ok/M1Ib4c7rHnvWuBdSKgZFoMZ5BHnvZiiMta1+eEZbVUSW55sATvgk6g6Q
         DqBxrPVw+Q1nH4o7kbBclk81+ea2NNiG1shroGko8zb8aHCuJ9Z8jnHiGMXAvIq/gf0g
         iuXj08SeHsgqzuLIfrW1ThZVR8DtI5O5a2k3JXZUF4hEWFOF7oCfyw5lzFLUvEt/L5AF
         k7mecXOkv63mvL8M+92pc4ZGpuyVzgXkfVWBldXSd6ctpWO8H56UInA0QtJaDfjSsFOy
         3vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398821; x=1745003621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W26FMtJNos2pFcdSRNrv49yeKOkyUMg/CR0EjdG43o8=;
        b=RwTjEErVqCMYr2BNiM3D2y1KDZofmNWlxX+qxNza2+gBAwT9UCAOELINDvUteRIMJA
         ypOjxtEdpciDUDXC6AJ6UA/+r14KbL5e0baRGDBpUZLT6mxjtLnFSf2DuMjUtwcdil8L
         3PfICAloFuFp6kngLtn8Lo5oXhRJH5zLf71JoExeIWG7cnhD0IKhKbSLj6JaQYIPljwn
         Lkm9WC3HMz6KO8rp102C/0scXHAzxOow0hwrO77mbPnOza9t0iD3oxwW6X/EccX7iJ5c
         wKH6HC0wdrEYxfJm0V0TnM6yKecwUIKQ3LTYBs6pKQC9FSlimSF7b+yY65LGcf+BYzBp
         NJPA==
X-Gm-Message-State: AOJu0YznGKioMOnh+kbpN3dumD8MYMUi6yr7WWF2MjPxhhSiZLBXZInL
	Qci1Tjwt9baMVaB3NpHlIfk9FrmOmL+LAiTtqDm4VRiJhX0J9pIvqxwp82AB4egkpA9UBbhacy4
	+jg==
X-Gm-Gg: ASbGncvlUfkxvYMtB6oq8Sc8aHi5UCmJHeGc5z/2Vjj/5fMBLlQMtrMJkr+2a06hfdq
	2SvklPX0tO48SkWXFvNtFCF+HogzO9DcZUFma7oss/ZFBupuZaSh9vVA8xAT3Puc6G67w9If9yO
	OQMJ9SpXcYqzfdw4r60MezGbm9fGDyKs3vkPX2WDihz8xKFaeZ3mNB5Yec9SLCWVouMpYCS2gO5
	Rd1f/muOUfxWRZ6GQC0fMhH+Wx/S8PlaJrt2H6HgFqaF/ykGqVMQj9AndrLPVdpS1zgbD3NuvRZ
	2HCQhcTOJYJ7x5YjmC0QwSLTROSKBuAC
X-Google-Smtp-Source: AGHT+IF8k+r8gsXo6w8DfASzpb/+2rXmCGjd8eLf9YL0fcqxhJuuePvkUfGWeGRKMJoAAnqi3aozPA==
X-Received: by 2002:ac8:5844:0:b0:476:5fd5:4df8 with SMTP id d75a77b69052e-479775e7a47mr56364451cf.45.1744398821346;
        Fri, 11 Apr 2025 12:13:41 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9bc9csm29706061cf.53.2025.04.11.12.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:13:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/edk2-firmware: add version to be printed out
Date: Fri, 11 Apr 2025 15:13:31 -0400
Message-Id: <174439881347.2238189.18072355630031188844.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250411032532.10270-1-jon.mason@arm.com>
References: <20250411032532.10270-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6461


On Thu, 10 Apr 2025 23:25:30 -0400, Jon Mason wrote:
> Currently, the version number is not being specified, which is causing
> the version to be printed as an empty string.  Such as:
>     UEFI firmware (version  built at 00:50:36 on Feb 21 2025)
> and
>     Tianocore/EDK2 firmware version
> 
> Add the package version as the version to be printed out, which results
> in:
>     UEFI firmware (version 202502 built at 00:50:36 on Feb 21 2025)
> and
>     Tianocore/EDK2 firmware version 202502
> 
> [...]

Applied, thanks!

[1/3] arm/edk2-firmware: add version to be printed out
      commit: ce4c7f6661752554c249dc1c62d1a41cc023d771
[2/3] arm/edk2-firmware: update to 202502
      commit: 69121ff4e5b298dca16781f67f44f345e143667c
[3/3] arm/edk2-firmware: remove qemuarm64-secureboot
      commit: ca5c51e25c82ed48bfaa432cac13ae061468c256

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

