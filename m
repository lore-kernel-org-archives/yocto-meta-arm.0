Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295E5C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 05:12:26 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.9382.1645506745060344296
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 21:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wN9K/uLS;
 spf=pass (domain: linaro.org, ip: 209.85.167.42,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id g39so22485212lfv.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 21:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrHOiTJokgjbu/fFFPN6LBAYD9Xv3LpWnBGOZ6dG1pY=;
        b=wN9K/uLSf/bFhq92jKanxEJjcGhUcVRKL/ywv9bD21e8rflicXW73gJxpFoewAyNYD
         UUgBOnk0hYsEiXmCFZvtQzIJX/1EIs4fIxNjoS5r0HhMjN2tbIMmMB9z7SmfmrYX/h7e
         zpbb3qP6rP+tu5K//uQlQr7KsgaiOaIjPVBNa1KFXBhZh/eRKq1NYnTsSbv1ACXR19eu
         DV0jno/JUdWRjH6mgZ0J3sWJxaafq3AS2h8JN7i1OUlmOenMRVK0bfQXLFRgR4heefC9
         FiFL6iYYfpk7doSrht/kpR0hZ7/Ailbt5bS3gQ//+YP99xvop3s/eLmuLV2mAgWTOogI
         EnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrHOiTJokgjbu/fFFPN6LBAYD9Xv3LpWnBGOZ6dG1pY=;
        b=YVXnCo3+MZTN9touUw3nuBt/6VS9eqJnyDZeWV7nocNNSoG9aB0+y71XhKg7WQr1YJ
         +mZ+F+l/XD/xUeBJW6MSavBxiNOhF8z0eTc+16v66V9IRizp55kKbGN1WNYW9fiCH4pd
         rPjI3338gTdW4byMxtbucOjUBvgYGRsbdFSUHgknAymSMPNeWQoZJ8qe+fnp1M9qX80J
         XemyxTTXRH0Qz9gDI8aCJvICSmjZIApnUW6yq8L4SsNwT4OAqMXRe6qpz0/PmV/HV4rQ
         G9TnIyeKAyhqwhH15Ft+1mz3m/TvLTMMrwpF6leXWGZc29cGkfTpIihsSBjK50/IsgV6
         N5OA==
X-Gm-Message-State: AOAM533iYiijp++LguUjKeQSmfzGQDpsFCTD2JlLvoLSVvELV2dA7ei5
	kRNA22w74g90e2zDOkNt3PPkAUPMlBqnZfLTHAdhoQ==
X-Google-Smtp-Source: 
 ABdhPJyw/6zVzl+YgREZxN4VW/BPOdHEykUtxFFcdlrVK2faTJ0i69rzn7IMQ0B/4QZrmTyCLNr+xgMWf+2U5YcYCOk=
X-Received: by 2002:ac2:42c2:0:b0:443:7f05:b8ad with SMTP id
 n2-20020ac242c2000000b004437f05b8admr15716542lfl.40.1645506743152; Mon, 21
 Feb 2022 21:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20220222022241.1389914-1-raj.khem@gmail.com>
In-Reply-To: <20220222022241.1389914-1-raj.khem@gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 22 Feb 2022 10:42:12 +0530
Message-ID: 
 <CAFA6WYP=E_tQ9iUBdoM-D-h7p3JEbBjGki1xY_LOjXY_gpeF4w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] meta-arm-toolchain: Use renamed
 BB_BASEHASH_IGNORE_VARS variable
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 05:12:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3036

On Tue, 22 Feb 2022 at 07:52, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

For the patch-set:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index fe23fd4..778910b 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
>
>  # These variables are used for armcompiler license
> -BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> +BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3031): https://lists.yoctoproject.org/g/meta-arm/message/3031
> Mute This Topic: https://lists.yoctoproject.org/mt/89309249/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

