Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F511C4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:02:46 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.29923.1653325359508852869
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=z4N2tnD2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id e17so12526735qvj.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VxOqZ97VgYJXLtL2ZkGUgJcnlVCoSo9LU2Nb91vdMaQ=;
        b=z4N2tnD20BTkJb0yw4k9gT2UZOdI5kxGRTzojhrKFR9Qx0yI+cJuWWG3L3hGR2KWOn
         Kq/BAg9oVJgUYeoNImmjSgG/dBxH/YqRplMbh3NSL+jZQEFNf9sbmW8HskpuaewUMs5u
         jxY5f/b5AgZQeEeI96xuIHe30ejMWk3BQrrc5ZaQuxQE++6mdLIQL+XFrYIAKD0GfgSg
         iFzCGDt2h8Go+UUf3vrU8TPOwhy4BbuHo/vO7Ojk8sDn1Eft+7dGiqsw+KTpNsl4pVQk
         Ux1U0sslLjWnsiX3u16tLZa7LSuc8yikVMeJXnAcm6bNk78XNCoydc2uoq41CFTCJLim
         fnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VxOqZ97VgYJXLtL2ZkGUgJcnlVCoSo9LU2Nb91vdMaQ=;
        b=QAZ5MTYKYIPHfRt6/cZnTWHOdxcKY+DNqAN2rIOMaTZ/9abgSfBv2iB5gci4WSfylV
         V8l61vFQ0WAyVqOysDplc069Y5DaPLkS9i5RbR9YNyc9zazSl1NoQXoh9YCaKd+dNwdX
         e4cnUd2QudAmaIji53Fuc+lJxR+4UU1eK4KIc/T7atXE5o7o8EJgqbKhqiC+PrpuhEMG
         RVzOgvqDHUHGEPFL11ZVO3/AQRcPw94bqjb5tf6GLfArP2D8qGbW9rJigp3yAcDCIG9c
         VfZlBl5FW8DVxzDIcphRqx21YOijKN1Z0Fhw2dsSZkE/3HOS7kRBF6WbIY8jHOBAAqf/
         a/XQ==
X-Gm-Message-State: AOAM530c04ZKOgfbRcfrGpMfQJbHuAkiEfiaEQ3jCC6HwfO3XO5Vehxh
	sG5pHci6ddqaX1fUXcu07xn+lNZG//q/lhC6
X-Google-Smtp-Source: 
 ABdhPJwo6k9XtGDUZcpmNhrBbM/lSTEAJZdM/Sar6cv0giLtZc5e0UPv78zRH1tFHfY2uuY47uJgfg==
X-Received: by 2002:a05:6214:e85:b0:461:e540:70d with SMTP id
 hf5-20020a0562140e8500b00461e540070dmr17690142qvb.25.1653325358451;
        Mon, 23 May 2022 10:02:38 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u2-20020a05620a120200b0069fc13ce206sm4499139qkj.55.2022.05.23.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:02:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/2] backport to kirkstone <corstone1000:
 branches alignment on master>
Date: Mon, 23 May 2022 11:42:10 -0400
Message-Id: <165332053185.113912.14445731479697939647.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
References: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 17:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3457

On Mon, 23 May 2022 12:50:28 +0100, abdellatif.elkhlifi@arm.com wrote:
> Changes:
> 
> - Align all repos to kirkstone stable branch HEAD
> - Drop the use of the FVP script and meta-arm-image
> 
> *** BLURB HERE ***
> 
> [...]

Applied, thanks!

[1/2] kas: corstone1000: set HEADs to kirkstone and drop use of meta-arm-image
      commit: 207f298a673f894fb26e36d60a9b0a1fca22a573
[2/2] kas: corstone1000: drop the use of the FVP script
      commit: 93cf02a8213c5e2d2edafbcd47ff571941ad0bcc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

