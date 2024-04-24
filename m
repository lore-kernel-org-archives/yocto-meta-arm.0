Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F20C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:14:46 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.17451.1713968080681014435
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 07:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xKk/lVBy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-790605809cbso379995985a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713968079; x=1714572879; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HGB/UdSxa5v2pwdxNkjX4uJK28YCFqyXxHLfYw3qKA=;
        b=xKk/lVByZbIPTOvYxlBie3tMe5gBiRh8y/+3O2EKSD6NG6jQ8Yz4FMrvmhpm1oHeiB
         37XD4xn8PB6tdTef2aEg1HSVL1Ql4Pc+mV2fGIi8TP+F73FD7dAXfshfb8S6z0CDY4r2
         hOC1rhHd/2g/99V1syJDMDFP4jNw+f5Dt0CJdXHPUclFLs/qaqPmUuhFXCJd0UsMN9cF
         +pGmVgklxAu4QbUAjXeL9d1mpFl9bQUOTCOnNM8w2RlfOMfMLAXxLmmV+acEl9532MUN
         Z+UHaBAQQ4GXNpF9fsKCMLl4bQwqwKRzvMIqGXUmdfhaFAPw57w3QniRQ1lXHDsE0hIV
         FwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968079; x=1714572879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HGB/UdSxa5v2pwdxNkjX4uJK28YCFqyXxHLfYw3qKA=;
        b=c67E54/hXkvrzjX+Fy+8w0rDCh8oUdMZoeHYEeKW/fHurVBT0901amcGwJltRmTOmo
         jltouj951UyUUduXKWq8ZGZz73ps9vmPpUnP/pjtyLk0rYAmBFlVy7wm44sQbqGhl9PH
         ngAHiSFsM0w8EAaygk1b4Ex+jvxXqV3v08LtF5HYlZzE4MnwQheKq8K77i6gCktuPr4x
         JbhmOYdHYOLLqCBduntOuwoDTt6SWafUgo07NTbjC8C2ccRuvHEG3qmT+KGHFNtbgUbJ
         PjPkUPgng6nuVzUxD5vptOiqRaufB/WOXJwIhwfvclMuPSYIg4T7XI2a9cLUcMMXXaRo
         aClg==
X-Gm-Message-State: AOJu0YxZtPYR+z3QV3jBrl/XwPlwWfmpsJmQFag+aM94fmU1Agq083Q9
	Fkh51BU5+yICr4uFQtadAP3EaOcEQu76UOIk5Ex1zwYMFSqLdpi2NaptvYiaNK+OcZVPDqAqSWw
	=
X-Google-Smtp-Source: AGHT+IH6wHoCoWFF13G6thx/FPzNhhQOf1BIoS7eDcNbBEBkj1yZ3Jd9RAnicKjnFb78k/oQBHaAEQ==
X-Received: by 2002:a05:6214:2a84:b0:6a0:99f1:75f4 with SMTP id jr4-20020a0562142a8400b006a099f175f4mr950127qvb.2.1713968079341;
        Wed, 24 Apr 2024 07:14:39 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id j13-20020a0cf30d000000b0069b584cd2dbsm6105904qvl.5.2024.04.24.07.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 07:14:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jdmason@kudzu.us>
Subject: Re: [PATCH 1/3] Revert "arm-bsp/documentation: corstone1000: update capsule generation steps"
Date: Wed, 24 Apr 2024 10:12:27 -0400
Message-Id: <171396794994.193657.17865708553312093241.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240423182517.2590896-1-jon.mason@arm.com>
References: <20240423182517.2590896-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 14:14:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5603


On Tue, 23 Apr 2024 14:25:15 -0400, Jon Mason wrote:
> This reverts commit 527475c354d8897d96eb7cb7248f4207cd8f44f8.
> 

Applied, thanks!

[1/3] Revert "arm-bsp/documentation: corstone1000: update capsule generation steps"
      commit: 08474f5ce44ab886821953766984fd4215e51612
[2/3] Revert "arm/uefi_capsule: use U-Boot for capsule generation"
      commit: 39d31fff7f34c59ce220541ee9b329d1ad166576
[3/3] Revert "arm-bsp/corstone1000-flash-firmware-image: add nopt generation"
      commit: 6b64cd3704bbda28debcf1171ef0751178f6fcf9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

