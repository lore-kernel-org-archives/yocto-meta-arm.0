Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88CFC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:33:22 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.2977.1659987194413218994
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=xTCMDpFG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id z3so7277158qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=IlrhYnux3J0qhJcPoSiVvbwoE66ePPx40a/krimylgY=;
        b=xTCMDpFGFNlpAyxVInmNKKNuV+xXWnz9xIR4ANqL5tbvQFu8F6k7U1wAaAUTioKIzo
         XBYBtUe2pYdzNydudv+NWnzwm412A9C2aDeYJooxnDxSjraw1Y558GIGgKLGV7p07dpH
         kkuGTM/+8MGJdHQsftWLP0vRehdoFKnxr6NnPmhA+ZSNXwvac8zhLBiAY4fu+lRkbCLt
         SPRtf/n5MLvKmnf68KNZ8Imzi3jJt+HcTPJoW9ra1czHi/Q/GMuZcjMNsYlEVTAqr7xd
         gturybif9jj9Hf3U1RHkXEPqwUJv9F0bYbpFwmv0IOR9u29GTNrypW1qX//s9vx8gazT
         Vjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=IlrhYnux3J0qhJcPoSiVvbwoE66ePPx40a/krimylgY=;
        b=admVN1Be/avxEziidE0HxryCCSgUUDI/UaKyvRRVwnDlH3NFJH6KajejJwcdvsaeSL
         NASRKougp2T+PwzXFe1VqNusmRtlQhnSpYOQevTRAz8l687jH1qba7ixH7kVDJDX52D5
         A7YHfLnVoN8ImslWjcGEMFJMWaB4jArL/Iyhx+89OlJvCM9rU4ejkvGvdwDALL/m13L8
         gNVeJSTNfplDTWpN0A/6YPKY24w+SrY2HRNNYSuYbRuglBcWfS0/fqBujDUPrqtgavBZ
         pQx7ATFI8gmaLPyyXIhdog6rB7hpzB8X1PstISs1PTj9KzFXqlWr3pU/hxaLqobblrAW
         k58Q==
X-Gm-Message-State: ACgBeo19yyF8DsPP4iCbghYwcKnd8dphQVy4+BJpjVRhPnuQGsPFatO6
	MNnrM4yuYZNPEXB4/Bdy6MuXqRUBRn0zfQ==
X-Google-Smtp-Source: 
 AA6agR7e9vsJP50bFn5SdMX7fadt43WAQCHo8SokRCxcdFIx0KY21XgKOoQe3jrZwGYUCWTrn0HUPA==
X-Received: by 2002:ac8:5708:0:b0:31f:d02:ff83 with SMTP id
 8-20020ac85708000000b0031f0d02ff83mr17549672qtw.555.1659987193049;
        Mon, 08 Aug 2022 12:33:13 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 m3-20020ac807c3000000b0031636caa40bsm8437804qth.65.2022.08.08.12.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 12:33:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] fix EFI GetVariable() issue
Date: Mon,  8 Aug 2022 15:33:07 -0400
Message-Id: <165998718800.2694832.12770523245997892632.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220805140950.26430-1-gowtham.sureshkumar@arm.com>
References: <20220805140950.26430-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 19:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3658

On Fri, 5 Aug 2022 15:09:48 +0100, gowtham.sureshkumar@arm.com wrote:
> The secure-partitions patch will fix the response from SMM
> gateway for GetVariable() call. The u-boot patch will drop
> the workaround patches.
> 
> Gowtham Suresh Kumar (2):
>   arm-bsp/secure-partitions: fix SMM gateway bug for EFI GetVariable()
>   arm-bsp/u-boot: drop EFI GetVariable() workarounds patches
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/secure-partitions: fix SMM gateway bug for EFI GetVariable()
      commit: 268f98c128c51925c69497870339c0bacbd36f93
[2/2] arm-bsp/u-boot: drop EFI GetVariable() workarounds patches
      commit: 44c58b3e553dcf5abe2fb522d128d864a2651c4c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

