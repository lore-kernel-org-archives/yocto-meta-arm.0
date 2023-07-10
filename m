Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DFDEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 21:20:48 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.685.1689024038322675880
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 14:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=WBOvtRRe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-40398ccdaeeso21175531cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689024037; x=1691616037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3ZcriqqRJD76CBbJBmHwiT0uWYqm8NtusT4sT+Sjvk=;
        b=WBOvtRRe5NSLYdMIixeLp2JKML7Z/3P5ZOZ5nZVXMPCaUIoP5al5acLee7OTQs6jHd
         x/aaVFUV0gyqzoe2wHrbp0AN3N6++Jv7bmzawleKKZ1L9kMTTfkP2fJ629VuZhnY9N0B
         nTgMHABsBIuhnhtFTQIr7rYosnkK3eTmQvB8Q1lz/s/iW9CvMRimCCcR243zpX298hbS
         TgB1XDi5Uczj4BW3xeymatGVT6OMDXzybNqFWwDsYCJP2m79+uuXEDw59weus+fPRu3D
         TbuKuwsgkmXmPS2SdWMI2YCNQpyym608QvzG9Z6/oQZxtjQ5MCvF8VMdBogUQlzY3gNZ
         PHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689024037; x=1691616037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3ZcriqqRJD76CBbJBmHwiT0uWYqm8NtusT4sT+Sjvk=;
        b=I+G2yUIwpoI+Fmmtg/xo3lqo7OoUSbfhHp0ZRuSaC6kHnZ1gy2uvrBdZD1IkO0vKZf
         opAXGhkPwdQ/DuEpBGN+UXlE9MYUGr+eMSm9MSG6/sBNiAgzPoMdOKdYN7ay5euHgpUZ
         KJbXcMUfNXad9S85Z/MF0FeAfc3L1Vx6hHXjdntdL9MUvV3biPimfGw0ZTqq6s88NhJW
         vYQRL/2XTzp8nqk14Mx12zH+XISdYVmw7YCMVwOjHYrRVqMXF1L/CRyup1Mf5Cn16KA7
         bdj1iS3NNOhryZ88BvzqnNYrD1kix81QxpYrLrIMOFqZKiJjomeYgBgr89XGBmpYq0xY
         wk3g==
X-Gm-Message-State: ABy/qLavCzAywlpVTvF/WORPYcHE+GJc9RRjwL7pv6tHMZboeD2JsHUN
	VCt9Cse+fCfKHqKX5ReiJZY7FuU4etOGl7kfPug=
X-Google-Smtp-Source: APBJJlEJeUOU5jzvBxJoXx5/d5tUsaK1zhgSrXfvIt7f9E6kkwGnQNAbimytHtPwgz3YF8C/Cyc3tA==
X-Received: by 2002:a05:622a:11c3:b0:403:a0a4:97d5 with SMTP id n3-20020a05622a11c300b00403a0a497d5mr9288608qtk.36.1689024036918;
        Mon, 10 Jul 2023 14:20:36 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id he21-20020a05622a601500b00402ed9adfa1sm310949qtb.87.2023.07.10.14.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 14:20:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	mikko.rapeli@linaro.org
Subject: Re: [PATCH][meta-arm] optee-os optee-test: switch from SRC_URI:append to SRC_URI +=
Date: Mon, 10 Jul 2023 17:20:26 -0400
Message-Id: <168902402803.121511.15269609956437813454.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230517081422.3778147-1-mikko.rapeli@linaro.org>
References: <20230517081422.3778147-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 21:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4876


On Wed, 17 May 2023 11:14:22 +0300, mikko.rapeli@linaro.org wrote:
> It is more difficult to update optee recipes to bleeding edge
> 3.21 when patches are added to SRC_URI via :append and thus they
> need to be explicitly removed with :remove and name of the patch file.
> For our boards we know 3.21 will work without patches but we still want
> to keep using meta-arm side base recipe and just update the SRC_URI
> to remove patches and update SRCREV and PV.
> 
> [...]

Applied, thanks!

[1/1] optee-os optee-test: switch from SRC_URI:append to SRC_URI +=
      commit: c4f30dbd5ce905d511df513cb0cce0bc5c052c97

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

