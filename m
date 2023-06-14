Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94E6EB64DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:09:15 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.11274.1686748152125902376
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 06:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=hwD0cD0u;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-62df4cc47d4so15891036d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686748151; x=1689340151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBrTN3+RXkG5w7JuIc2ljMRfKqOUKkGrdjSc4BJbsBg=;
        b=hwD0cD0unFJRi6fo1eDaqJHnWN80fkGmXJt/pbnlOuG/lyDznjLHPX4MhYrhoolxFH
         CGutQCW7O9B1K345qMigSXWzu+bXb5082Dyo8z9k5vCapa5RisatGIRQXH62MJcEzHRT
         H9oCPhlQVt+1ZbFZozDEdzwXYjPrOEvifedqn9iAF5BLqktkWxPhdmYWw4C6QEJImfp0
         HkKm/3MJbf/JhTVBItgZUeOxP/eK9naYO4sWH0nV18OHBErzgXaDQfpI7Arqxv1FLBmV
         RLetDnvTTPDkhpdzU3ybeVIpBrNSnu6Xbx/ZUF/wuPScpJIrwDNKCaqqfVbR9kD77lge
         fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748151; x=1689340151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBrTN3+RXkG5w7JuIc2ljMRfKqOUKkGrdjSc4BJbsBg=;
        b=YHrHNPv4uSrTfmuGYmQ6NFfDCD4AmIcmDXPl51xORiiwVUWZM2zgDlVXLnEdwg3+Hh
         12T1AQ4oBuf/xx4tMIsZRVOVQE9vN0jjQDUXGI2iAaD/C6OwmGwRClqHMxtJ57no55tp
         wBM+FjCYmXdPMrcyOgR/zNfNvRWt1yYcKtUUts0vo29BFUdf3MWHszKlqb+likiqflm9
         aKCxyr/GU9Lk9lu8F3VLID30Yz/MGOEB1ObWUUdkI0ThRBw7HIbm6J0OneTpVsdFSWJu
         cWvbdZEdIGM29XNNsYD/GN+nTdWCxmg/AfJT7ZMMSY4RNbUgO7btjvpq6wsN1NrK5pyD
         raag==
X-Gm-Message-State: AC+VfDw6dgVDR4HS7W2hplnYMQLYvRLXVi+9ROSa7dwOuE153+3DKISl
	1hIC2CdjYl4IBzHCG7DmNMX4D5JWia9Am7ftzkA=
X-Google-Smtp-Source: ACHHUZ47lnoKPaFgOjIHYTaOofK7HTXeynJUChXxQfAHYm3Sx+QnV0hMRX5Bb7TthYjVPuwf1xVMBA==
X-Received: by 2002:a05:6214:e6f:b0:62a:cc88:2023 with SMTP id jz15-20020a0562140e6f00b0062acc882023mr18967394qvb.5.1686748150745;
        Wed, 14 Jun 2023 06:09:10 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q14-20020a0cf5ce000000b006263c531f61sm4695851qvm.24.2023.06.14.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:09:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-toolchain/gcc-arm-12.2: remove
Date: Wed, 14 Jun 2023 09:08:05 -0400
Message-Id: <168674808553.2420450.3374845050004072138.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230612160513.938778-1-ross.burton@arm.com>
References: <20230612160513.938778-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 13:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4783

On Mon, 12 Jun 2023 17:05:13 +0100, ross.burton@arm.com wrote:
> This recipe is a rebuild from source of the Arm GCC release, with
> patches from oe-core added to make it work well in our environment.
> 
> Most people are happy with the GCC in oe-core, and this release is often
> behind: at the time of writing oe-core has mainline GCC 13.1, but Arm
> GCC is 12.2.  Users who actually want the improvements in Arm GCC will
> likely want to use the binary toolchain so that they can have support
> from Arm, and they're welcome to do so via the "external-arm" binary
> toolchain.

Applied, thanks!

[1/1] arm-toolchain/gcc-arm-12.2: remove
      commit: 980f37d4d3d8eb034c08dd05a52866fa0fcaa5b0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

