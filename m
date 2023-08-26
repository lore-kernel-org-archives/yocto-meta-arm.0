Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E448C83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 16:08:07 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.11070.1693066077174638900
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 26 Aug 2023 09:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=B/IqgjbY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.42, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1c4c5375329so1296378fac.2
        for <meta-arm@lists.yoctoproject.org>; Sat, 26 Aug 2023 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1693066076; x=1693670876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTvl/msW+0PjpEDH62ULK2F6cNv23bOc+xdp3V6MWNw=;
        b=B/IqgjbYWYm6OK8iTR2gZ9iyw/2dXVGFSPCJkOfFigw6A6d+9jsFFxQ8pTKBVqsN+P
         xxA8V4bvzh9P7lTx43XQieT4JiQkPQJQbNHbFRl67RZz0P148aBRFVwBtVuhL7j7dgPR
         OWKj0kizrJYYFcxP560vJu/bWYNHcZVdXVvMcFRY9BeYFw7Ni70ivy95ln9NpbFtKTxM
         7QSVURswG21K5bwKeHLVVSwS4QfYGJkcSG4YfyQWEG3wNNsRt500RaHnvtfP4p+Jdld4
         wFFUev1/IibLqLhwEOnueLfrstTudHR0iAs/sFqugIQu1pkPUO9Jr41Jy02Snt6Vu082
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693066076; x=1693670876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTvl/msW+0PjpEDH62ULK2F6cNv23bOc+xdp3V6MWNw=;
        b=WVDdPxWMmf6zItOASmnCyWS7RqEKw8WQFJelUOrl22pU88MgaCryCsNLcfiaEU+sfc
         2AqclIeZXYrgMaRLe30Dw6ot4TFesEIQ5F2rZgww3ps9cq6bVEvwCZPqIvymU9j9QL0q
         jGz62xeHdNpc1yVPOQgfSVrNDDffUB9+ZFyfrf+dpc69DTFdj/51G0DhwWXOFKu6tQ8/
         V2A1l7nkK74uEACqFvsh/2YyaSFvhP8q8KLEHJu6pvxuDNGbolmLBJdlIey7n6JIQ8aC
         5K6CcQ+tvPOv20pS0iOybRJ5p2sLHTkPow8/XhxzFc7WoJjNGqMAIClyw5plffMQx6/w
         AWSg==
X-Gm-Message-State: AOJu0YwP6iuJbZu/6FiBOOb3N5m7kU5QAhX/XLFQk13GI7zXWzCJIH+U
	GkmrgS7qr7wArK7QMeZ0fC7ckxB7cwRRTpMCYfk=
X-Google-Smtp-Source: AGHT+IE1WMwE2AHrmP5uwj8WxNxsLtwrfUmWKHziBHVkPEXLmQ2vtB6bhfDpr2RhZfzQSUcG0QnJhg==
X-Received: by 2002:a05:6870:e253:b0:1bf:8a8:dfa with SMTP id d19-20020a056870e25300b001bf08a80dfamr6148255oac.11.1693066075825;
        Sat, 26 Aug 2023 09:07:55 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k6-20020a0cf286000000b0063f7a2847bcsm1331847qvl.51.2023.08.26.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 09:07:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][kirkstone] arm-bsp/secure-partitions: fix build with GCC 11.4
Date: Sat, 26 Aug 2023 12:07:19 -0400
Message-Id: <169306603942.2243.1791266556318882420.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230824145303.1956465-1-ross.burton@arm.com>
References: <20230824145303.1956465-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 26 Aug 2023 16:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4995


On Thu, 24 Aug 2023 15:53:03 +0100, ross.burton@arm.com wrote:
> GCC 11.4 has improved code generation and needs the __aarch64_cas4_sync
> intrinsic from libgcc, but one of the modules here doesn't link to
> libgcc.
> 
> 

Applied, thanks!

[1/1] arm-bsp/secure-partitions: fix build with GCC 11.4
      commit: b187fb9232ca0a6b5f8f90b4715958546fc41d73

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

