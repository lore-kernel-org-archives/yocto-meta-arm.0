Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A77AC04E69
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 23:21:16 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.56212.1691796070073310972
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 16:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=b8Y9Slny;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-40ff45065c9so17321291cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 16:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1691796068; x=1692400868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MATS2jZ7wjeVpJJX3b8RPBmB1Ywf7X+zVlgPWYDnjAY=;
        b=b8Y9SlnyEzUEHVUyQ1qzasKOuZYNRLaZ+BewONalqKGyB85pmyXdhwNzxDWKlCBpQF
         bN3VhYSOIUB/XMBx5oOITXnFq8UBurS2HTGHxV1F8tWTBuF95iiVDRtSNM3OOW0f/P6+
         tWed0cQIHSZLmnMEMj+yUz6EIR+pSWiM7iF6zrWLSMy2RouWUYuoxSrHox0Qcc7jmMCx
         fdiNPOMIILN7a8goxQ8CKDv3YITVzf66qLJvV2R6zhums4OAwC1KSZHrLIEb/HWX5lAt
         ozR7PDuYyv2ieVeaQDaoOdYsedWBGwH1/1ycE9XuW61zZWZny9LMaLsfqiK5WmPxlFLQ
         SY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796068; x=1692400868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MATS2jZ7wjeVpJJX3b8RPBmB1Ywf7X+zVlgPWYDnjAY=;
        b=l4//3hw70BTOJbWZYjRa2QqK/JxCh6vNVLvwkCKJC01AWfGEokISwCnVKidTZ2HmtH
         1ZaA97EwVMyAReFZ3GLtq6TTI3T2T53oT+I3biRVzsAJBQZUCnLbyEQnRdlaJz2g+zaX
         Al9HsGn6f/p3bHuX1f6JyrVMWtFyB5W14oxvlNZ3MfXZN9qoFEiA2ZwwMVBY3cOfD/wt
         mbX/YUC/h7tqgqJlJLen2RKXL1ZFQwmt4nN/UVuj8Ti2fL7aTwXZERp13d6W6VS9MdU2
         iIOHYuURiPEnO/SjvTt9hNdoUjar/nGCbEfR8lK2y3zaSBP/b/h7vKrOk8wWkcUIAbcW
         P9oQ==
X-Gm-Message-State: AOJu0Yxh7xKPmlpvS5/qac+/+Ih6m0raFU7H5Vz5+J/M1rpbezbY0iuM
	Ug6vwTl/rXKhkSE/ep/AMr0zrtwIcS1cld3emGM=
X-Google-Smtp-Source: AGHT+IGBvSAnRyMnEU5KPoy4t0zRUB8invBTSfKAEhZunhIpbaFXPdfSVp6cvaGbUctXwbNot1gIzg==
X-Received: by 2002:ac8:4e4f:0:b0:403:1c7a:6c70 with SMTP id e15-20020ac84e4f000000b004031c7a6c70mr4567272qtw.38.1691796068614;
        Fri, 11 Aug 2023 16:21:08 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y25-20020ac87c99000000b0040ff2a9ca0asm1469305qtv.67.2023.08.11.16.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:21:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: update to 2.9.0
Date: Fri, 11 Aug 2023 19:20:43 -0400
Message-Id: <169179604656.759796.14498889581315502643.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230811184217.3627478-1-jon.mason@arm.com>
References: <20230811184217.3627478-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 23:21:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4954


On Fri, 11 Aug 2023 13:42:17 -0500, Jon Mason wrote:
> Update the trusted-firmware-a recipes to 2.9.0
> Moving legacy recipes (2.8) for tc1 and corestone1000 to meta-arm-bsp
> 
> 

Applied, thanks!

[1/1] arm/trusted-firmware-a: update to 2.9.0
      commit: 391b9dc0a933643459e2657ee4ccc071d25071bd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

