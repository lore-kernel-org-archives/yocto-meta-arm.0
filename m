Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4216FC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 14:59:41 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.8487.1665500374129785111
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 07:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lyxs3ciX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id 8so1160535qka.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sq1Sdnh2AXycF+iUfmmSdqLbD0Spuao0X/YTH/NUcCQ=;
        b=lyxs3ciX5q7K7HXbiBWftd7PNr8hKvWakG9W4EybXO8cwirbX5LPv6Fpnl95J/3fVD
         wvKGQ7qbzJF9l1Z/YLRZLuFSlnyoLvgJvEoTN/7PdccAIcCOHAVmIYYoUYuIngF0SeqH
         dWp5s03OKn4Xez/OyTAlmE+ZFHaNNIaQxujFBux0PIbQL86yUWLvKP3xEewpS7A22T/n
         OGzjE8DCJrCZErTx6ySrQ9FdExtzu8xKEKrTMR7tKRgMFElPoZPCAwQqrPyTEMAQ+0hU
         Fh/LNfURfmwnC3OfMUiJC+g25XNVJyBlDjhh6TQsPlMDWS4WGSMoFn+Dg4lU6jx7GqBJ
         nRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sq1Sdnh2AXycF+iUfmmSdqLbD0Spuao0X/YTH/NUcCQ=;
        b=V/RKaFyTMCm7oDZCPUca8SVtS9+tHKqMAzIQcC0kQ1lz6/vCBOuJl7qrgsxZzFEpdQ
         My6EUDSCpnAtdz7UKW/HEXbw3x5CYWXWP67PwDJ0QaoS/lbLEM5A+p0sUd+ONP22BYbC
         NGgZpGqnNdyrWq4Un8u1DPczQ8YAHVo3T6G9cuwPb5ussC6kezdELitYaCSxi7EaVywX
         NHq3mfn22Q8lEwtW9sXGwDWtqVAW7TerKmF70BSU1YLH57p1e73RRrfN5lf5/dXY+g67
         7fYwJwYYcw++T1M9nMgRnf+YYYq+pfnZH/VGryAq0/UOzJP4sIqDp2rfzlNwL6VDcFdi
         kzug==
X-Gm-Message-State: ACrzQf1rahrpfcLOx4Lno1UF8dQGjnGSZWHJvGgBm8w9Ljon332MhCFS
	wdVXcpzOJRl1MW37+7C9Lwe4UV1OIh/4Fg==
X-Google-Smtp-Source: 
 AMsMyM6SHPg0Br+hw+6ZhDmJ5OQEjNFwZbyAUbyKSLAt+UH2llDfdWUo/v6lnajNWLaULxk/45+gSw==
X-Received: by 2002:a05:620a:29c5:b0:6ce:b03d:2a06 with SMTP id
 s5-20020a05620a29c500b006ceb03d2a06mr16553119qkp.552.1665500372681;
        Tue, 11 Oct 2022 07:59:32 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a05622a014400b00343057845f7sm3979951qtw.20.2022.10.11.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:59:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/trusted-services: Remove patches merged upstream
Date: Tue, 11 Oct 2022 10:29:55 -0400
Message-Id: <166549859650.944759.9058515894738200631.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221011105951.821881-1-Anton.Antonov@arm.com>
References: <20221011105951.821881-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 14:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3950

On Tue, 11 Oct 2022 11:59:51 +0100, Anton Antonov wrote:
> 


Applied, thanks!

[1/1] arm/trusted-services: Remove patches merged upstream
      commit: dc4c85ccbb120588edc591e269a4e6d87e6bc904

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

