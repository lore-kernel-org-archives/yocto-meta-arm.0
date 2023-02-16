Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52585C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 11:27:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.7692.1676546840392972546
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 03:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wanFQjwA;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id a13so1587241ljq.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 03:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kbFSW9klkwZDXvKc3pBJC1jeVULv4vp/rE1pbhG714c=;
        b=wanFQjwAcBWXrBUCrk7kpKvbhwXKxKCiJXKH3D44moHn2wnAwpGnatot1vMP8tLmMP
         0N2zxSbaH3FM3xRgqFFNql2JB8MRx8PfDfd+JzOgMfYQpqkJpYAyvhuvz7wsYv+FhukD
         QSn+LjXCjb+8RkgmBAIJgCxU6ajsRX9mGOA7j2NglxEzHqSyIn2vKgY5FvL2iATgU8Kh
         aP5DcM4257Iuv2Hlg7XTjrueQPfG71AoL/IkT4ZzNQoRY4LNBekx4e8wOLC1DoQ3XP6c
         aGusnD3l0jOr9NqkHkRxmtuVeudu/FEw0dnAFs0bzm3UzFub36pRN8fijtKybyveG5nD
         MbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbFSW9klkwZDXvKc3pBJC1jeVULv4vp/rE1pbhG714c=;
        b=iJyvt/d7uF65b69ATnrNHa/gi1mXpEdYgmNlNUprTuXPI63/l1Q0W7CDe+cAoLJQxT
         VGKzd5K4nEIqtfq0wfFyz8aG0GoJad61pq+7/eUshzrKCFMlHpBnZxKz8Sq/bh0ZVXVt
         CQxL6ze0JxVy7P69i8/85zr+18Z06K63UELd+fR/fuEJ8dkMbpNQSm5F4TZH9CACLtN6
         oAxIjJ4bDlxwVv7cGzkdCnXamKtjaHXiihKzUgUIprE/I+TshWTARZAfBy84Es8+xaJu
         OF5cLIZ6lPjiMjcQbpvGTI763UdU9giojj9PUjceA6Ekf0lMd8jaQbgue6o622DmO6/5
         7GnQ==
X-Gm-Message-State: AO0yUKXWfSaTIiuof0THDG9DpQAO6ixiW2XycoU+ToS5KHyAn+2rUzLN
	bGCGKMk61tIExuDl/UjeMz2zsA==
X-Google-Smtp-Source: AK7set8EZcsXkGnfQ7cBqI0fiCkrtSrCsQBHI4qUrZ5SnI/mqMKzVxLihf829cseRcJ5vM7q1X4Cvg==
X-Received: by 2002:a2e:8e2a:0:b0:293:45dc:7172 with SMTP id r10-20020a2e8e2a000000b0029345dc7172mr1487037ljk.6.1676546838245;
        Thu, 16 Feb 2023 03:27:18 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id x17-20020a19f611000000b0049c29389b98sm261040lfe.151.2023.02.16.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:27:17 -0800 (PST)
Date: Thu, 16 Feb 2023 13:27:15 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 0/4] switch from :append to +=
Message-ID: <Y+4TE/4YsimbmX4J@nuoska>
References: <20230216105640.147967-1-mikko.rapeli@linaro.org>
 <9E6FF485-3D70-4176-A1D0-8D050DD4B867@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9E6FF485-3D70-4176-A1D0-8D050DD4B867@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 11:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4405

Hi,

On Thu, Feb 16, 2023 at 11:15:42AM +0000, Ross Burton wrote:
> On 16 Feb 2023, at 10:56, Mikko Rapeli via lists.yoctoproject.org <mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
> > This same pattern is used with a lot of variables so try to find and fix
> > all of them. Hopefully there are no regressions due to :append and +=
> > being applied in different order to the result variable.
> 
> That’s a pretty huge “hopefully”.

Yep :) It's a risk which I'm highlighting.

> Did you just blanket change every :append, and did you verify that the parsed datastore is unchanged?

I did not verify the data store. I'm in the process of changing our setup from
kirkstone to master for a number of boards and this became a blocking issue at recipe
parsing time.

In our setup we may not be using all these recipes and appends so I
would need help validating this. For optee-os recipes, the changes work
correctly and we can now update the recipe from our layer.

How should I validate this more? A world "bitbake -e" output before and
after? Which machines?

I did check the details several times and the changes make sense to me.
There may be some corner case which I did not spot, for example variable
being appended to and then bbclass inherited later which would break
with switch to +=.

Cheers,

-Mikko

