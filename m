Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D79C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 03:14:52 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.3542.1662520482448104388
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 20:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=p+r6EAsH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id c6so7387475qvn.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 20:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=FgCqHTwcVmbBJis8dSEpTr95ew5F1vUJyFSk5vFJk2s=;
        b=p+r6EAsHuyRGlfeG5nK8zv2EgD5BA9FEAGHR34v6nVuDVAB6FavnhE7yfkpkPqAZ3f
         MPxQ/UACB175oHJM9T2ACikqROZafuR0xxvoHRo4jXNUzjVKslZTW4ha/XcA5gaH1LOn
         frsyQR55ZlVBlkipVg4TW2VglgHYZn+iEZlM1iErP4wJ74+qstoHAF+ZP+knLm2XqL/M
         lrglJJ9wfTmVptjeDXYt1hQS15aTkXcXtQo9os3LR4k2rsK63/RkdCtmIPdPyPQlD+Yp
         W4WKYNoVYI068Qj+h/6PR2kA9nCoHtOK9IkX6QVL7KGb2jVe69tcTZcOuubI9lgvln8G
         R2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FgCqHTwcVmbBJis8dSEpTr95ew5F1vUJyFSk5vFJk2s=;
        b=xqTrPIL7eo4mVNAhGN0pWXQ5+o9jVW6meHUQjjtmWbndYp7qieW/TnC6+BP7xRzhDS
         EsHNtRKgXDSALG8Rk6BLMDlkRJ8oeFC1us6Rn6w+rhK9Chrv3GvFfH0fGxxfu4p10YES
         u35cO1yKlEfyCTODjJFx3xUplCnKZbjLO6vtY9HXF2BPR/ihFV+ZeMNDgt7Ns4BCYvvD
         lN6sn6VPH4WeEPXb7+gDKx96GY9x64xWqQrv0ngJr795/HJB+Zvv9LoQ74rVQ5haV0Pw
         0trahgZIZT7bRdJVpolEl8iKLfovmSW1BejnDEuuFRrYGwJkaz2heugLC7QFpi3CLM8j
         H/KA==
X-Gm-Message-State: ACgBeo2ZKYUka6Q5evE297PUA3Xs1CNJDooT2wwEZMfQksCSem6QEh+D
	iCSPZx31hoBDqP1RjVjd4Z8uLlf+5etH2qhi
X-Google-Smtp-Source: 
 AA6agR6AMcIvL+pSVVUj9uznNYHAI5PXnN4tMbrAiik1mlOWFc6apAlBd+xkxdL3kkzD2zZN25CfRg==
X-Received: by 2002:a0c:f084:0:b0:49e:7bc1:26a3 with SMTP id
 g4-20020a0cf084000000b0049e7bc126a3mr1497370qvk.107.1662520480994;
        Tue, 06 Sep 2022 20:14:40 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w17-20020a05620a0e9100b006a6d7c3a82esm12253789qkm.15.2022.09.06.20.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 20:14:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp: trusted-services: fix openamp build
Date: Tue,  6 Sep 2022 23:14:24 -0400
Message-Id: <166252046407.1129980.9921945653141147765.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906164538.1503942-1-rui.silva@linaro.org>
References: <20220906164538.1503942-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Sep 2022 03:14:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3743

On Tue, 6 Sep 2022 17:45:38 +0100, Rui Miguel Silva wrote:
> With the latest gcc, there were some unresolved symbols on
> opemamp linkage, add the implementation of that symbol for the
> outline of atomics.

Applied, thanks!

[1/1] arm-bsp: trusted-services: fix openamp build
      commit: c039d1601f7b643fd6ffc9054d7c22f58362b40b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

