Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABB1C83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 12:25:10 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.16032.1693311909449665448
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 05:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=DGE0iRIO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-76ef80a503fso288081685a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 05:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1693311908; x=1693916708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUB6W4dGE5chkKiGk/vuusF/WRVWuhd/j4SaFEOJkG8=;
        b=DGE0iRIOWBzZrOJbgR2qArAv1c4ZTVrHq2YDYW5/tjrUo1ViwSCbVQOcT0yaYqw/Ij
         u+yOBPulVDc9qGODK9GP1Ae1bRxhTYngdpppSzJHyBOM+BhKzXY1mrXL4w8P0nBPyFoo
         KTNjRW6+jdT8/PCh6YPty4pr4U3fdf1UhQ0cCSENRTvY+PqicivygAF6Dtl8V2nTuu5/
         /PN0H45z+93hNRAouEwaVhYoglKmaBeydjIzh/msVc0ErRVeRHwOQt4f1D/gVjrgowvA
         Svh4ksghuWJvilCqI8ikShIXz+ooMcNVoZxLB8RHvhK40v75A5Tp5rAYXQEXoyO2Lw0Q
         O46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693311908; x=1693916708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUB6W4dGE5chkKiGk/vuusF/WRVWuhd/j4SaFEOJkG8=;
        b=S4O7dsRz9GYBm+61fFkL6S2eYqt91VSSZxiZYMn/Zg8hPQhyKIBmYIBSaYB5tvmVU7
         uRi6QAYtUL1nPnajPdW55ZKb5u1lTjN8vRPJVdA8bM2gHv3ubByyQsHHSbMsf7DyguTo
         JUuxJLBQHIEHYpZdyepyoPXDOLTym1bCr4jNmAC6/SdbZzoItyu7bTN90/VCYBW1W8j1
         r100LnFuGm4G80e5vNwhio8WJ47Z3C9IuBrkwgpPPAIhlYw4WaXDnRmSlJp+DBMJkOp8
         X4rKkDsrm4U0/pjmY9ZV0btJ54IffxLi4FGvr5fgk6sGtBmpI4O696LK7mjgqelZhn6O
         AOcA==
X-Gm-Message-State: AOJu0YxA5zgKSlYSgou5xQR7KngW8ghc4a9TQQzffXphReoVBVdm7U2L
	DaBtiuTD331BEXczH6FP4pQIPNygdFaNF2+eoYI=
X-Google-Smtp-Source: AGHT+IGnCnxyv8XqKLEBuKNOK8dcuHqoCis+dMXGLmkQPQMizfgZ1CHOzHon/+AvophUTKV/D/IE3Q==
X-Received: by 2002:a05:620a:f14:b0:76d:4252:95d2 with SMTP id v20-20020a05620a0f1400b0076d425295d2mr34488545qkl.39.1693311907945;
        Tue, 29 Aug 2023 05:25:07 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ts8-20020a05620a3d8800b0076f21383b6csm271679qkn.112.2023.08.29.05.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 05:25:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/tc1: update optee
Date: Tue, 29 Aug 2023 08:23:31 -0400
Message-Id: <169331181213.1741519.1676383911084941534.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230828131447.3682473-1-jon.mason@arm.com>
References: <20230828131447.3682473-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 12:25:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4999


On Mon, 28 Aug 2023 08:14:47 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm-bsp/tc1: update optee
      commit: a7ff45bd4fbb593b578458698231434ff67a0fde

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

