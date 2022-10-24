Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7546ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:37:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.344.1666633032518934548
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 10:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Tm1t15Am;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id g16so6046390qtu.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HjJp2T0HDGx0dXOVZvsAugwrvJ/b3+zgTxgyqDVPW4=;
        b=Tm1t15Am9B7bM2pUYTGXpQ/z4B6HVhxA6s4/QQXhEnhhbr+K4Z5SH4j3IyBKXUdEzK
         /04RQnkzP8yzFKyRK3T7wGPNXKArqhi8/eR4AM7qgN2500KE2qRO8jYc37cTVcLpzIHR
         P0gaK6cDDSGqXFZgONgpP1RsWpubaijEyHVH7F8SPzneSjxPlpDbALJLzeAmEfUIxRzF
         UmYarMJpxii8rSIL0qP+i24wnyP+XiE5rSYtrUWtszgltuN5YirtQCHi/MZdlXoSE8W7
         AtJvJjXoqqUshpxBYHjvQpBYblSl3Lay0yB6D55N0Ovup9xZC7vCwJjyTAxIl2n0QV1t
         E5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HjJp2T0HDGx0dXOVZvsAugwrvJ/b3+zgTxgyqDVPW4=;
        b=dQZdyIDDUP+ZLboFJBa/YNpnd2+ep/j4t4TrTrEuJrDL9BBhcrhPsF42SjGGD2xAsA
         gHg8suzawFSJb8vXTntdQdOM6rY5YkmZoo2PJAqu+BpEO0BytWSSPCyrBKjF4cEJ0Po5
         4TaCa5QCTGstrShOswlYIKQ+oOzAfIHjPgs8q6V8OkUEnfu9niLDnpJxELspGzH+iOa4
         Ey/dj6Unj/nWdMdWro/gO8a1eWgSAjMjPkF1D4rWM/rQBXGDH/1NU9s4Ds5eTn9WlS30
         JoJKqZh0TySJhz/DUYsn5/1ScvEWO4QTWW3aBzWA9pqBXZvWb31YA3GZ25op36DJHu9s
         gBfA==
X-Gm-Message-State: ACrzQf0YNag5smNMeFNFV2hnFwp7DrXOTltJQuUZBtzj+bZ6vlAdTPGO
	9bzSUPCl3Eik0KFMynS55lKwu5OLJPCilg==
X-Google-Smtp-Source: AMsMyM5NGU1UPbt3CwbqkGMlYPp6ew3mSET84y1dHCiFgn4QPlaU9V2zMF7UAH8ime/DKyoBUX+bxg==
X-Received: by 2002:a05:622a:407:b0:39a:836:acfe with SMTP id n7-20020a05622a040700b0039a0836acfemr27811539qtx.133.1666633035222;
        Mon, 24 Oct 2022 10:37:15 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id bv17-20020a05622a0a1100b00304fe5247bfsm266623qtb.36.2022.10.24.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:37:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: add documentation job
Date: Mon, 24 Oct 2022 13:36:38 -0400
Message-Id: <166663299865.2899578.7865728712913827989.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221024125635.1988032-1-ross.burton@arm.com>
References: <20221024125635.1988032-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 17:37:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4033

On Mon, 24 Oct 2022 13:56:35 +0100, Ross Burton wrote:
> This job builds all of the Sphinx documentation it can find with fatal
> warnings enabled.

Applied, thanks!

[1/1] CI: add documentation job
      commit: 72f0580f70e771432c83418e644d92e46dd33a58

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

