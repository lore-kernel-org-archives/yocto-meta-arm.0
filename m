Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6DEC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 21:38:16 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.28614.1749073087793054333
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 14:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=V73Kgnl+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d09b0a5009so35625485a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Jun 2025 14:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749073086; x=1749677886; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCoqRz32Yw3fWaJrqEDxfs7mRs9xDbE3s/KNO8yGdBo=;
        b=V73Kgnl+4u8g+imsVtiN+d/1UuEKpsPikBPfoSU64ymdyHlqgc6WOP3FlXUg5+ID6K
         qVf2zZi7WPmGdLpR+2xrKDujgoyjfv+G8WhO+I04RI04VRiwfoOSU8U725Z2yIjnlF5J
         7YBE4lHY+ey7F5UjaHKfbJU0VPKRXjxvGzdZriYi5buC0PodxaoLQ2HUNYmlw0dXYTRB
         v0c9zl3jQRmYF/RMNsm4632hgwS70ofqfkboz+7ArIihUfdDqm/vVO+jGVCOiRNt2ekc
         vOmfkkd0OzKWz+CzcL02vdIA0EoC21Rr6kUtB/94TaZh9QZC1fPqefazrX2y9n67OHi5
         0Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749073086; x=1749677886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCoqRz32Yw3fWaJrqEDxfs7mRs9xDbE3s/KNO8yGdBo=;
        b=QsTP/RdoHs+DDygTdgw4sgYoyjyHYMK1QtBaEifGrDabgrV7D/XS/phKPPIzQ0q7mU
         ozVsP53M9ak/pIKlpYYtNhSBPizMendrwrA0u37EnL7i6zllvc36tCzcVMM8H/zGYt9G
         umdOkbVYvFrCgLZlqceemQceV/k4KSua1fq8iOBMNfxS3UIYD5sdW4JLoMX/4h0Yq67L
         1YICzq43Q+WTkO05qqaXGx6Oz1nEJWiUzSjur9FF34CNOV6MbQstPncJjlqv3DBmda6/
         eR/9Dw8j85OyZLoEIjNGAOIoC/+rIbg5ZPn/AvhtY/dSYoLWy5T2NOYTcBzQYV7r4Fve
         5/dw==
X-Gm-Message-State: AOJu0YzVE0JHwQVlwSdiremwNrBRjyopkMGibxmNQ9TO2OtfspidyblW
	QcLiK2DP3ZXk7tIerEWEaSnn2fhiKyAuJ6+mE8Tz5ih/0S5kD0uXTr5QYR6FT0v2kp5rjBJT9YA
	I+W5DBA==
X-Gm-Gg: ASbGncu++SiI1Iw2wRND4zf2iM9TTRK4WTIyIGYvz079Do4GKQUdWMFICUZ1217/KvU
	JCr9RD/LfPO/u56/1+yFU8bVNkwcRqiEuLkiOk3J7W67NdNv3hUsNA1x2tdhgXuj9CsybSBOnF1
	zUlZDpNhQPPS8emvaZY7zkzkXqghhtPJnjQlR+dSa7MXeK+heMQzrYacMXcMf0lAtIN6rBXrCwk
	I8TBE3QYjMoGPNpBZQwr641IUDs2UQbQMcZaAR3A3dmcsMSLSQ8FRUH5au28eEVxEcxBayyXuBN
	kDZ/YfnicDrZRlhVCZdMh6W2mLLUiRL18mRhgWI+PYk=
X-Google-Smtp-Source: AGHT+IHgsu/JiuffnvBitGuvYvZH4hYgEqlparUcvpTjCWFdBSQ6VQZJvpHqKXTon/pW1B+97sBNPw==
X-Received: by 2002:a05:6214:242d:b0:6fa:cd35:3da6 with SMTP id 6a1803df08f44-6faf701aa09mr60393446d6.41.1749073085610;
        Wed, 04 Jun 2025 14:38:05 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a6f6sm106803036d6.96.2025.06.04.14.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:38:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/trusted-firmware-a: update 2.10 lts
Date: Wed,  4 Jun 2025 17:37:58 -0400
Message-Id: <174907307799.2988566.9766297194557602749.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604142509.15895-1-jon.mason@arm.com>
References: <20250604142509.15895-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jun 2025 21:38:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6528


On Wed, 04 Jun 2025 10:25:07 -0400, Jon Mason wrote:
> Update the TF-A 2.10 LTS recipes to the latest versions, which are
> 2.10.17 and 2.10.15 for the tests.
> 
> 

Applied, thanks!

[1/3] arm/trusted-firmware-a: update 2.10 lts
      commit: 1250d00074fd085ec97e66a281a535c0c758e8ee
[2/3] arm/trusted-firmware-a: update 2.12 lts
      commit: b4ece023fb4e98262cee291983525539111bcef4
[3/3] arm/trusted-firmware-a: add 2.13.0 support
      commit: 8a11dd3a1651a6b3ad36520aa94ab1045fc8aed3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

