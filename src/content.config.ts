import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const notes = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/notes' }),
  schema: z.object({
    title:       z.string(),
    description: z.string(),
    date:        z.string(),
    dateDisplay: z.string(),
    updated:     z.string().optional(),
    tags:        z.array(z.string()),
    lede:        z.string(),
    status:      z.enum(['published', 'draft']).default('published'),
  }),
});

export const collections = { notes };
