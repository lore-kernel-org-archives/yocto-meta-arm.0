Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB07C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:15:16 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.17467.1713968110550980608
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 07:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ndwxbb+e;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-69b59c10720so27800976d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713968109; x=1714572909; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFn+NyuMVPnJsFzcXpIc7GEZIq+SVMS/kmw+OD/c++U=;
        b=Ndwxbb+eVVOCNuXfbO2fBFjJ1xaepcotmwX2DotFYUU9ku3SCeJttjlEy4fWAghY+6
         aYk5ozBZG1nx3mfm43hgokeA+9rh+EieAubi9hvBA2TpT4VArkB9ypzP/TtzCDLfUR+C
         uIZ7saukkgmo+IEOCrd1icUDg0tJ2OP8LvDCcdauMvzi1/RKNqmc+i2DX+Lv4tfuUuCL
         /Fv4OLz/c9/D/VKDiHy+E7ltMEuC5ig9d7F4KIOPDyA9X/QxQ5Zk0Tbjr7Z34CAl9sjw
         PGybjutDCYyByrUdeQjxSmue47rZEA194DjkUUHitbtJya7syvRh5/sH/a3GM6fm5G2W
         wanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968109; x=1714572909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFn+NyuMVPnJsFzcXpIc7GEZIq+SVMS/kmw+OD/c++U=;
        b=TJjOo+kOJVc270ENZ7Aus0YwzaKuwO51tWnEURxmp1bck9hwO97qAgPyiWsS9oZtIT
         6DHVYpqzsysi/x48q7nkkf9BMBiORd0fVSqpmdWn/UKNFx9evccaN/DjcGGkqKQC8sxq
         kTORBsZSFFWvW34hFnX+smAsGZJ5hm8VSU/EKxTSArI20i9boJRwhYm3a9rAUAWKDksK
         swJMPD1qB2HrjAdRr/KWgPS+g0DC1OHEEvwtGrZtEi/e6krLrMrat3paNUZ5g21DhjK/
         e95Wy2+9ywqOmJP+xgOa71RtIE6vAX3auLjVQASQ6TP2OIl9BC9yPzpsAqMg66GivWVN
         fCeg==
X-Gm-Message-State: AOJu0Yx3k2ELe+fLHVKTF6kPnYHTa0K43QLJh2tKPHVCyYzCaJ7pMmDO
	6Lt0u+Vr4yvFZbjaJkyN/DQ8QcZ9BOe6K5eRNZT4XSmmLyFA2QtjhwB4a80yyfQ4ZTN1lcxZ8ak
	=
X-Google-Smtp-Source: AGHT+IFrlJMi+cdp23xjbyssDAllcSzFdfwNIoVlUEsxV/fgaAOMuhYry5rGPGf50HJFJaU/Obkb0Q==
X-Received: by 2002:a0c:f704:0:b0:69b:3572:b214 with SMTP id w4-20020a0cf704000000b0069b3572b214mr2474334qvn.20.1713968109444;
        Wed, 24 Apr 2024 07:15:09 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q3-20020a0c8cc3000000b0069947ad3b46sm1903554qvb.65.2024.04.24.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 07:15:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/6] arm-bsp/linux-yocto-rt: include linux-arm-platforms unconditionally
Date: Wed, 24 Apr 2024 10:12:29 -0400
Message-Id: <171396794979.193657.15295297177149716522.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422133739.190536-1-ross.burton@arm.com>
References: <20240422133739.190536-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 14:15:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5605


On Mon, 22 Apr 2024 13:37:34 +0000, Ross Burton wrote:
> Every platform should have the chance to try the -rt patches.
> 
> 

Applied, thanks!

[1/6] arm-bsp/linux-yocto-rt: include linux-arm-platforms unconditionally
      commit: 196caca51ba9783a7a207ac11b879bc4aa9effc6
[2/6] ci/testimage: don't :append to IMAGE_FEATURES
      commit: 77ebe8b8cc3219f798ad716d942d6a82286572ce
[3/6] CI: add genericarm64
      commit: 9c6330a0b15e07dd351d60d871053938ac053245
[4/6] arm-bsp: add new sbsa-ref machine
      commit: a86f62f1449ce0e341ccf1a1004a1177e4db4e9d
[5/6] arm: remove generic-arm64 and qemu-generic-arm64
      commit: 10e23fe1dfa66513dbda668d807ea3e384eff49c
[6/6] CI: sort jobs alphabetically
      commit: 0fabb8c3dd3c5f961eec7f1e075874294da14db5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

