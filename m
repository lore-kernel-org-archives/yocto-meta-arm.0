Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A21DE77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:44:12 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.40257.1733499851715543949
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=1a3dL7e8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d888c38841so17271996d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1733499850; x=1734104650; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhqVSVDf5wv+Ullcq0vGnQfLINU10Z678tQIbclOMkE=;
        b=1a3dL7e8/PdLFcexndG/ACqqCI0IvBAoLm3yDNEskoOq/W6mxVr2ASu/K89fDkpZOk
         +EW6xdmmLfMaRke7nNJ7tdlxMAE7uD72KK+6VTVO4UqYuv6fc2IXV47m2cgMNgd63tb3
         nRKwnYlzpOeF21DfRXGVWkJ5G50z+PBKBEl4UywuS46qfzngOQx0KJUMmOcWOWh3PE25
         461bAWm7I/6ySPkLBC9c60jGjcYDxi1Cnjp+byxPQR/3A0ZWiokk4JtaK3WAXd5XYiHW
         dlhp1/T/VelD39uv0TfWrOCXgh01CiUlEYqybV2KSbOJDLF40TTtQ38sdMMlTOT5FaWk
         cQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499850; x=1734104650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhqVSVDf5wv+Ullcq0vGnQfLINU10Z678tQIbclOMkE=;
        b=Oo44lb3h8p5y1w5e8FEscislJ/ydEIUhShO4tYiJbecHTeDSMKyaoouKdTwbfWLf0a
         tlVmMruztXAbYoqFqLLlvIOVNQNi68wVw7WGJSpnD2l47SNMjtHhdoDldmXOQwttuHc3
         Y68UqNn/uYKMT+wizI0UBNQsTpDAo+P1uikYArK57cdGWeLRPGhwocgcmqikwNPTuiYM
         VYhh8V1oCqrZG8mlixNYcyIz88JX4yeQAI2Pb8PnmcJOFoQDLx1Vz9gTISlxw16VqWKT
         qfvUjHhkLfrBFUZHMchPOyyVHzYhtJSvUh+q87ffIBKcQPLTfU95GTda6c5YO2qJ+K03
         l8PQ==
X-Gm-Message-State: AOJu0Ywz+jJuZhsinzJlhqoO5OwmHdFExGM5+uCynTqdGCT0/o4f5ADa
	8uMd0kRRoLf7I9D7jbwcbu9ZOGceQPWjiaZMaEn6msVw3ywiA5piLPQKZfumQuN11DuyUupUaWk
	=
X-Gm-Gg: ASbGncvNcdNFqGcuv/HjwW0S5H7Q2eE4ZhPnHLTnUX8pTkIjAG06BypT0rAmHMG43i5
	tmST2bhbQT70tWQ/bd4NBRsjMHd5rz8DJ80hUpyQ29sj6lI3YWHuIo6nK/p3ZMyll9z8ABSEXJV
	a5CQeOMmwMXTh6ED8+u25goExrZ/tNs5WT7mP/ZrlBmYanSzJDocqJ86tvmzynxkMlnYVKG6odW
	Q8TtzJ/zDRA+w4JWtq8EpxubljVWOL2ikxiiPepzA==
X-Google-Smtp-Source: AGHT+IHiqj2UCEnuBstQTJpa2eeH0smLfAk5eG/5EU4PD0QmHLVnDU5dEcfiWPY+/b89YkplG5O84g==
X-Received: by 2002:a05:6214:2488:b0:6d4:238e:35bb with SMTP id 6a1803df08f44-6d8e715ddc9mr59292066d6.18.1733499850678;
        Fri, 06 Dec 2024 07:44:10 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fe787sm20030766d6.86.2024.12.06.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:44:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: Re: [PATCH styhead] arm-bsp/trusted-firmware-m: corstone1000: Fix Secure Debug connection due to token version mismatch
Date: Fri,  6 Dec 2024 10:35:41 -0500
Message-Id: <173349934367.2735333.9327878121866796668.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202100215.945453-1-hugues.kambampiana@arm.com>
References: <20241202100215.945453-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:44:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6278


On Mon, 02 Dec 2024 10:02:15 +0000, Hugues KAMBA MPIANA wrote:
> Due to a mismatch between the ADAC dummy token major version and the version
> in the secure-debug-manager repository [1]'s submodule [2], the secure debug connection was denied.
> Update the ADAC token major and minor versions in TF-M to align with the expected
> dummy token.
> 
> [1] https://github.com/ARM-software/secure-debug-manager/
> [2] https://git.trustedfirmware.org/plugins/gitiles/shared/psa-adac.git/+/refs/heads/master/psa-adac/core/include/psa_adac.h
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: Fix Secure Debug connection due to token version mismatch
      commit: 30519676ab506deddc5f378741f4a7acc3b02cc5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

