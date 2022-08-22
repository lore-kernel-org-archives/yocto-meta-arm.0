Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261DC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 12:26:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web09.17376.1661171168341683678
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 05:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TzO4jIFS;
 spf=pass (domain: linaro.org, ip: 209.85.128.181,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-3378303138bso247683267b3.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2FnptPr8ZEHqUYKzu9fJ+N+JrqufJKD0MDGUvl6ayq4=;
        b=TzO4jIFS/p18tBPbsCDp0/oqhIm4kCljMvIhUXzoqMnrdKeZcQO56qO9HoLN8K2hHW
         uXl1bohGcrbge2EQxtr7J8/pn4H9MjtIP5Uz+nuLF/EjW5AjLE2XMbsK75KAo+nXUAqn
         N8oYPb52upTY3dDguh/eupDkdXrvYNlbLR1ylIxLV0JX/KGMDM5KZJuaOyFwBoKFjhS9
         DtEmpdFBH7+LeSzn+uKnlGOsAYkJBcJpLLQ4SRorv6Nei00nT1a1HTspDCw/dYIlZDlC
         ekt1gP2jN/YYWq0DJFa2QHIHn8RIZ3l/NcG9MO+4HkFVGjAOBK1RJve0D0UYCo8MHd7B
         pdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2FnptPr8ZEHqUYKzu9fJ+N+JrqufJKD0MDGUvl6ayq4=;
        b=zgxcUNf1jlu2MDN2VsGW/BumIPkmCWEnKwyG+N0BmiFH587cwqkw89LKfklae0SX4Z
         fEi3g1ZRuT+61PZ/AgALQCLhremyg5yM2V17VaG68qihEgGQsAIgtjbjVtESBeDV0XkM
         Tu+BC4daI39uRqY8/K28yac9sz3Qzds2VeNDzpFi8P4lD4xwxAZuEnqlJXHmC3Y2XdNd
         WWsVGUDsS3IqZJ2D8zimS+JWxi9iFpmQSv154490P2gO1S4FPo9QcnkMvimkIjEn47nj
         HhRIszgCd7DGIAAqxTJ8DyHGNTZeweJogpgxnZm03NqvLr8821XyaHNSSUrALzCUBlO5
         9+bQ==
X-Gm-Message-State: ACgBeo0RaTDM8G/kYLigmG1QZvJrlBXGblK5nWaylNwlb2aZ8zapvb7v
	OsYkUw5WlmAlirx8/jjdpsrXJzqEXWveRqE+1Li/7w==
X-Google-Smtp-Source: 
 AA6agR4AzRiiyvccLPDdfecuus84o//MdyjpqB5qRSgJxG5AOGrkqvPE8UfvXu+eP6WwtGmZXXZzONqRMnlYcsWLVf0=
X-Received: by 2002:a81:d543:0:b0:325:2240:ce5 with SMTP id
 l3-20020a81d543000000b0032522400ce5mr20240266ywj.210.1661171167593; Mon, 22
 Aug 2022 05:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220623120814.214530-1-leo.yan@linaro.org>
 <165600452595.3412483.1717133633458528746.b4-ty@arm.com>
In-Reply-To: <165600452595.3412483.1717133633458528746.b4-ty@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 22 Aug 2022 17:55:56 +0530
Message-ID: 
 <CAFA6WYMtNfuW44x4f_RwAVyqQ+bwb79HfyQs1TskBBiSmJ05jA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2] optee-ftpm: Update to "main" branch
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Leo Yan <leo.yan@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Aug 2022 12:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3707

Hi Jon,

On Thu, 23 Jun 2022 at 22:45, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, 23 Jun 2022 20:08:14 +0800, Leo Yan wrote:
> > Since the github repository doesn't contain a "master" branch but has the
> > "main" branch now, this patch updates to the "main" branch so can
> > download the repository successfully.
>
> Applied, thanks!
>
> [1/1] optee-ftpm: Update to "main" branch
>       commit: 6ef5382ffee3de7f65510d04290dc8e8f69701d4
>

Can you backport this fix to stable releases (at least kirkstone which
I know is broken) as well?

-Sumit

> Best regards,
> --
> Jon Mason <jon.mason@arm.com>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3537): https://lists.yoctoproject.org/g/meta-arm/message/3537
> Mute This Topic: https://lists.yoctoproject.org/mt/91941411/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

