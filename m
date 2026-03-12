Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FB91067044
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:20:42 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24319.1773328838502314358
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 08:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LwTrSV3R;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd7ecedf2cso115763285a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 12 Mar 2026 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1773328837; x=1773933637; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e373weG+GTx8W3aOTl94f07cFkSKBK0EGO9VLcUAkQ=;
        b=LwTrSV3R4dYe6TBXAUs60tw8EOzb2vCSiOkcyjofCMws4WiCvurzysIP4EJ+Ipntyj
         qgLAPohSAqBGDkuI0dZpq81ovuLCmGqS3XX32AslnJJ1kvWRLCo8Fnb2KD/putG72/ha
         /7zJR1kCVK8m9kmuosaeDueE01t51IgK5cO2i4jMYEhNj3MYbJhtDX3GgiMoEUCm0pam
         b83XX/YzKj+s8VCdftAAfP/difsEWd1AkVfqdRS3jXVQ9RrN4wF6cLc7tdFf86KEGDt7
         Zu/O9T2rCO8RBCghzxviwFOcZ1Cc8bahWfO069JAFz3qQha92JxIgGiPTSjIYXgAd2Nv
         OPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328837; x=1773933637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/e373weG+GTx8W3aOTl94f07cFkSKBK0EGO9VLcUAkQ=;
        b=tirehEvO7qOzmIPWf0Ae0u8nenQiIFP/QkMeBclAcFyEOmPmTBhXfVhW71s9aprIWY
         eJGL/eCV61OjPfSAk3BCAvnkKoW9HXXD5cXB9lhKSXHgiZjTGK6fgvkUsKzIPJDoQpEN
         tVR9n4HnTaP+91iF+t20fS/bfKMuK5adnJtuZuG+46GrHh6YEftitr3zdeD5z5e4rNxq
         TeZHS7i11c1hDM09r9ZQ5On/MYdXjfwt9DJyc4YvEz/QHXvtPDb3iZ7kpun56IVePDAN
         p4n7HJ3+Wen3zLokxeMHnkItmSN2ekRfpRQIZmoqxosqyNUWdrwtpYZnjd2jwJvg8m3Q
         KrmQ==
X-Gm-Message-State: AOJu0YwjnLVIA7Y6g7h4ChBmgLcmv2mwqN6wZSOmXpB+b+YyHz2vtYAx
	C+tskfDaQxM5YrdiwhYWYSAA2xNI9DOgFOqPCgi73eiE5TG9uGXOmI3fwbdfjVsMb0Ow7tqUGjE
	X/M8=
X-Gm-Gg: ATEYQzwbibH1hvFP6zJDh9URf0Nn9o28BnV3eu5nblMRbhqvuDEO2RXTEkIpK+x8Fe1
	tIeWL4HaiWktkFwNvAq/whMG5r7ftGKIVc+YXvIGCllEuTPRyH2cqdPMuo58i/6DFQf7ihu/Cp0
	bq8T2jzIXiO96G6dQJU9FPItKhJck9pZvr2+eiwRMQ15XBRDpSizzrD8lulPLZkiFfJGSc2/WLz
	8JYD9gjn58NOpQP7PH1EfVthw7+pR/mIky7iX8sVKYAx9xq1AEDg8eQOI0J4wLPXVTL3P5R0ngP
	KMeKGMDP5Pw1+YyL6ppQ4+W/E0RK5BSJrxA6nBpd6+peQo2RWg3QfDQcFN7+Fi/u/Xw0cOk+JYn
	WSHUB4/mySdeZMOpRD9wUbICvU72o/pL+AO5txym8xmEeS5Zl5ahPQqmnHsT/limsk4KCx+vqBN
	Dv5LPf34bv96On
X-Received: by 2002:ac8:4546:0:b0:509:4109:4ba with SMTP id d75a77b69052e-50941091206mr54091871cf.70.1773328836850;
        Thu, 12 Mar 2026 08:20:36 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5094665cd2bsm21437481cf.25.2026.03.12.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:20:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/5] CI/uefi-secureboot: remove duplicate entry
Date: Thu, 12 Mar 2026 11:20:27 -0400
Message-Id: <177332882772.389493.13613737732165361651.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260311121244.72838-1-jon.mason@arm.com>
References: <20260311121244.72838-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Mar 2026 15:20:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6951


On Wed, 11 Mar 2026 08:12:39 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/5] CI/uefi-secureboot: remove duplicate entry
      commit: 696c1482e67b0bd3eadec3a4db996768f0c397fd
[2/5] arm-bsp/trusted-firmware-a: remove unnecessary FILESEXTRAPATHS
      commit: eac46f4c5eff66e298a23f2c0b1ed8866600ff8e
[3/5] arm-bsp/sbsa-ref: fix qemu warning
      commit: 0ec2763f339284630e3da37abaeabf744808f061
[4/5] arm/qemuarm64: fix edk2 and test it
      commit: 9b1bde435ebcee50177b5173de17fd29d060205e
[5/5] arm/qemuarm64-secureboot: get edk2 and trusted-firmware a working
      commit: ae2af2b852ec5b6e8019ee7b00a2628cd593afb2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

