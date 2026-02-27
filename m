Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4079DFEFB7F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:01:04 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103873.1772218857017361740
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 11:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=bYdPkZlw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899b2cd5a83so27980216d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 11:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772218856; x=1772823656; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4Ah7yeObbQ1axhGjYX7g8airVYYPeoeWdEgz4OdZqc=;
        b=bYdPkZlwXR/XpCdKTbi+kJgR3UuFUVEoOnb/+dKzT3jw+/bp0Erbn7XHLn6P5wfe2Y
         m+6s2Nl/Hg9uwclg7eMx60CoxXXuF2LsgqSzBYQhEUuwHU9nnYyad0fSpI8qwUaP8A9/
         vS42NQVdCem2pLKmGq/rt6aI/mn+r6kwCWDbpvR/730pG14e9LxRxfvfB3vT8i4sojqk
         651nuoObwfsir3N/wyTbuIeY70tjXCpTzh7DkMKZU1MrBHFnbNGqPb07n5ieH3Yox80h
         fs/d8PUDBqWnBNg9rahxjbHyIPPqEiWsqfIbxTmdu/TMt0/GGv3F4nm6yC7vL7btt5FW
         yDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218856; x=1772823656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+4Ah7yeObbQ1axhGjYX7g8airVYYPeoeWdEgz4OdZqc=;
        b=JvOuIXbLZTSxOX759Na6OSKQHXJwhRJlNDA0IZNm5Pc0P9cMzJsIVoq5yU/z0CgNtJ
         LsEcRWQzSGk6xyppoOMdXX7I8uJFp4LW19z+WJfyK3MmtNQE0NLhGYBvQIoELi+cSKHK
         UMDEuS7+/3Vk0zMzQesQXJuDXHTlyzvXrvLCHgMzvvGSssIDmTA7Nh6q4h4bJrjIWMij
         IeiQU0XT9WLdjBq+0nNB9hgOzaNG0oTVrxRxbd2fFC5eCdBL/T/CE1lTFDbV1AQ7YfrK
         eHNPFM/A9Mixk3MF1QaQcrxzAkcmFunxl7QAZtM1rmsYOwSO2Qbiw6U9oa0Q6zGVnf1Y
         EWKA==
X-Gm-Message-State: AOJu0YzUBgPTP/ozK23UKvj0WHb13lyKfKThF9d+wMq9isgQRggUk6Js
	ZYVsBenZBzhdm35uyYlqMXdv60UgmY3X15QCwYaS+nu5Y6dpmytOiXZt4d4SGVsjGK4Ssx7CLAp
	wqXE=
X-Gm-Gg: ATEYQzyNuhpd7D7VE3v1jD/4sKfEqD+gsRMLlWqsSUAYaAHUzvs2z/tvWCXjDgUSC7c
	eGF6lHwswIT88ABTCUnFzIePZdzmYIhi88nVE3hNLMcjrA/mJOnUNCmdM/zhVZN9HJGOvVnFdUy
	PTMKMe8ywTanPqvaq3MBkk/2dUPvo7TIMmiHwvo9Nuo9EmMC5bEtNOvG8QAheMKU1Ep38EmJ154
	YB69TD5pXpPWSMemUS2JTfSf1XAqcE4notGUclib85988O96pR619o2sS4u7WgnwB9MrB9P9q+O
	qxgTCaQZ3Re0/zrgWORRg9tG6AJwdp/+1/YyS3IEmqK7bA7tv/NzmmAo5VrDzS3kfVc7UTPZLjL
	8IEjNT+DK1p8ZDy5LanPGXuU/FNW25h8iIhYGCq6aylwjb08wPWxcL1zr5fYPwSg5RiYKTZqK+p
	vqinB1O4Vt1anB
X-Received: by 2002:ad4:5dc8:0:b0:890:7f85:81d1 with SMTP id 6a1803df08f44-899c679a8b8mr117222536d6.13.1772218855504;
        Fri, 27 Feb 2026 11:00:55 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716caebsm49256886d6.15.2026.02.27.11.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:00:54 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-toolchains: Update to 15.2
Date: Fri, 27 Feb 2026 14:00:38 -0500
Message-Id: <177221883995.575698.1607140699247745961.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227141434.69360-1-jon.mason@arm.com>
References: <20260227141434.69360-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 19:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6926


On Fri, 27 Feb 2026 09:14:26 -0500, Jon Mason wrote:
> Update the pre-build Arm GNU toolchain to 15.2 (from 13.3)
> 
> 

Applied, thanks!

[1/2] arm-toolchains: Update to 15.2
      commit: c0416d7426f0e3e9b88d42edbfe506ac67b93e71
[2/2] arm/trusted-firmware-m: workarounds for new(er) toolchains
      commit: b00fe8862bc31cd4b6f0299b6a2edb244f19487a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

