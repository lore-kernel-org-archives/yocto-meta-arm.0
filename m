Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE412CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:03:50 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.14873.1760706226648483295
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 06:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=BKMvtOjj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-87c217f4aaaso15098246d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Oct 2025 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1760706225; x=1761311025; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fY24WjiyJ0q4ijHRrGdqjISH17UFqJPiGDENPt9PV0=;
        b=BKMvtOjju7K/mgP2qgYjqN0jBluWW4GAJb9IjWLghFT/hlZ8NU4xAdiZZXDsQ+9p7t
         L25txaFuHzjwuwjOJqWS9C3yEkJIZYn90saP28Bm4W4iuY42OFJEroBrZ7S1NeMIDqVZ
         IDdinMYyoxHCNq90TUYChh15iz/PPfn94GLsYLLd5q2Wzqe8S0z9Y0CoJSzIjRM/2WKW
         cctrJ9fUHiP7ronm/f67u3+cHU/7/p1zaluh0HOSinylWfg9rNtuup/oCoS3ayvKd3QB
         fIDS7qfnjneP6+Y4GEmSH2MQsFSVUGvbP3WX4KU1Quow1IZwJrZBkqVNrT25G4DybTPT
         2H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706225; x=1761311025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fY24WjiyJ0q4ijHRrGdqjISH17UFqJPiGDENPt9PV0=;
        b=mpkw5yaZolKh7hQLh3Q7QGPJ31MkkM/DLSgT2TkmgcXlPUQAG0v/GgmjsCip/3wg+P
         lL9KYIfB2pM41lUUWdgI+MNKZnl8r9er/1URTr4hlGaSUieQcYLxFI1oYpYm0Wm//+Ck
         J9r6UM2U1B24HWaL4pVawiNB+uy4pXBKnj6Va2wcxTrEU/eMQsRtIgv6pqed3960OaRT
         T0JMj7KbBJhbewNuOfbovYNRqwhxp1P9Mm5ncAqlenYqOOrgj3czhX2NkvMw5y8SfRlZ
         9r3/wErgpD40fMkkURgoTwbhVL4/pun2NTBp8gMvCcGGH90Ou1a6Ef1hIhiee6bxMNoU
         Xb7w==
X-Gm-Message-State: AOJu0Yweb7bDWhjweD8lF3jOR3//9Xsmch/U0Cl5Jns9TzwyjOdYJj5q
	Q7qsxa2hQK05FEA+4ZRCkiBYK/qdn+RKHNksrRN73Jx7uRExTYi/AgWft3B9XoabyWeMJ/BlZ5q
	TMLw=
X-Gm-Gg: ASbGncvAbAhMD9sIRKsGsxV1HQW61wq3+OvDdDS07fcd5uQCKtAp3uBtkauiotC5vih
	xTSylLSDE4NsbjUGAHzKGGOKAg1gN3qrchVb5a5cIWZaWnIYYl6LjfrnLvuH3j9ARM71lkwWZB2
	hjyrBdZPk3d+HuKLh02XL09elw72j57mK8kQXQD5Bxbs4uqY89DTginVyXAMNRzi6S3A/Wxl7jm
	4AuvI73MACWuK4KiMBEitEekRNWr7cf5pHymCjodWyL576ouvEeloAS6/V5U/I9o4jfxVkPqpdJ
	yOoCbSfPukY/WGBBLpyaBnUQ0XKIKYXm72UVuztkxA7H6enH+QrrY5iGQ0xQpoy93u6aqGO/AS4
	P/T7fnraD/7S0VJ0LUITO2teTL90KH/BWmmxmlXjsg3lWRUpJFnrCqmA33LbnptWbLq4=
X-Google-Smtp-Source: AGHT+IGeHKJ+RVkkKK9PZxMIP/tCpudGvNDN8Bk/ytF61QUK8EnmK43JJAvWrNYAvP6RbpQr7JGSjg==
X-Received: by 2002:a05:6214:40b:b0:87b:b6a9:1876 with SMTP id 6a1803df08f44-87c2057a560mr48816566d6.26.1760706225178;
        Fri, 17 Oct 2025 06:03:45 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128d801sm61646596d6.38.2025.10.17.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/trusted-firmware-m: add missing trusted-firmware-m-scripts-native 2.2.1
Date: Fri, 17 Oct 2025 09:03:30 -0400
Message-Id: <176070621154.1945921.16927507560233737765.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251013150415.3173432-1-ross.burton@arm.com>
References: <20251013150415.3173432-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Oct 2025 13:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6737


On Mon, 13 Oct 2025 16:04:14 +0100, Ross Burton wrote:
> This was accidentally missed in the TF-M upgrade to 2.2.1.
> 
> 

Applied, thanks!

[1/2] arm/trusted-firmware-m: add missing trusted-firmware-m-scripts-native 2.2.1
      commit: 7ecd385ddcb64b0e221c64585dfe1283b4384b59
[2/2] arm/trusted-firmware-m: remove 2.2.0
      commit: 3969f5fc31b915e296cb14751da2a1a22346d998

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

