Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D1BD39016
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:29:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20217.1768422553263484155
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 12:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=SMHqTXut;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5013c1850bdso1768681cf.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768422552; x=1769027352; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bee7TRJYoMGrjLRvRaYvhd1XzSWJAe4IxkHReCVqfb8=;
        b=SMHqTXutLmS8i4FQZCeck8+PxCTrcCo9fokThMrxLegVXeM+sS/zUkZmVv7qfooqXM
         09LcI2l5yskZ7kACF8Ne+EDX25kP8UkpJN3aOiyAFCsB4pmHG1c4G+Gj3iZtkhLvJrSG
         JR4fhCx2wFU5r0G/cj1jp4no2YxuTeJX/qL9gC8FEzG5EVpOj2AP/aW/NvyBfczDNN/4
         lgKmnD3jaEFJIHGsbkKMSJmYklnULrbPNMI02Vo6PuAzeK8D0BQbYPdf0qaIy9Px5Sih
         Cny5GpIpQtC3jU7KaOPVFqjFnz0xn+PUkHi3rfzuZu1yC2J/tMKrk22fwdCe1tN3pXve
         E+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422552; x=1769027352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bee7TRJYoMGrjLRvRaYvhd1XzSWJAe4IxkHReCVqfb8=;
        b=xHGL3coh91Xfdg6XfRmI0wLDiA2usxz3BqQ+/0G20VZKOThPQ6UY2R7bSVQWAW0eAj
         HC5e57B/6vbxAyRCYk+mIrF+pvFJzY1CBdmIh3rS9YYbXfQe9DM9iDAG5H2Ei4ieN2kQ
         w89GMRXkHH+y7fnW5pZsltezsMy6u3EXvWF1Znp4d6ijg+1t47q2RKmQq/87lxCr4DI8
         4Um29Igd0j62eZZskLfe63Fnt0zY31Tg0cwBZRkpoNH+7DOIl3tUflaN8YVQsWq2dEP8
         +WjSNDtw6vPDT7gLEiILBPg5P+vlhiz5IrkElEfnilQFuNvmvIo9gIXWmImQqzcMudma
         RpTw==
X-Gm-Message-State: AOJu0Yzrmc7s35ojxSfjPr6M0g0gQPFdWuCuEA7JJIb0SFlwbqEjMybn
	avNYezWGaLMPUh/i7kAm+a2s6e9AkkSibp8udjYKJ3nJnBU4IYn4WN/+i+QSIBmOdP7oqKNyQxl
	RLBo=
X-Gm-Gg: AY/fxX7v9GiU6r7dFhlWdnTRYcTUprTFW0bHM10gYw2ASL2AJYVzPKqcaTPv4zmFEXj
	L8d4DPtG/sZF81DQeAGJV+os4IDmDsMzEBRkRonstFaWy1yeZGpn5M32W4a57aMeOkYgQ79YlG7
	fKGeSGB6PuITB0hRzFOy4CH/EgjvPRWT5cdN/+e1KK1yYE08exbj3jPv6ZuAn5qfJk/j/ZkMzaE
	X2tFP5Pl/07tx5SN7wEM6juQvsKK2T9rrcKagnjillMCfOs+Cn0VBq1gAspkpDBLWXJNyMobA15
	q3QIWNeAib3FQY5RuHvOPVLE+qtIcOHbQ7nOHyqOrZIiZcLk51P/XwemG1pOfn8eiz/7sd1C/+S
	ihZeBA9EQl7j3OaEYSc+M+I6xmGazaBfm+qiwwKTQcB3t+tDbePtqbG38V/Kkp45OadEZKvfkOl
	eW
X-Received: by 2002:a05:622a:188a:b0:4f3:59c1:768c with SMTP id d75a77b69052e-501484809f0mr58441901cf.60.1768422551951;
        Wed, 14 Jan 2026 12:29:11 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148eccd7fsm19973561cf.25.2026.01.14.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:29:11 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	frazer.carsley@arm.com
Subject: Re: [PATCH 0/3] Firmware binary path fixes
Date: Wed, 14 Jan 2026 15:27:58 -0500
Message-Id: <176842248235.3731607.7844280855058840197.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260114092452.286544-1-frazer.carsley@arm.com>
References: <20260114092452.286544-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 20:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6844


On Wed, 14 Jan 2026 09:24:49 +0000, frazer.carsley@arm.com wrote:
> From: Frazer Carsley <frazer.carsley@arm.com>
> 
> After the firmware.bbclass was added, some paths were later incorrect or
> inconsistent.
> 
> The first patch deals with consistency for multiconfig builds, ensuring
> that the subdirectory hierarchy is present in the ${DEPLOYDIR} after
> copying the binaries across.
> 
> [...]

Applied, thanks!

[1/3] arm/images: ensured consistent firmware deployment
      commit: 604c7e9a4e6f41c9e8f47cc9acdb85f0818e6c00
[2/3] arm-bsp/docs:corstone1000: update paths
      commit: 514061a36e35404d7731a21614abd1ab6320cc20
[3/3] arm-bsp/conf:corstone1000: update bl1.bin path
      commit: 568b3622cd1d659026ab037297b2abaf7581ae36

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

